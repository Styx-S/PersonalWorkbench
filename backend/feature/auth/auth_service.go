package auth

import (
	"PW/foundation/db"
	"PW/foundation/define"
	stringUtil "PW/foundation/util/string_utility"
	"crypto/sha256"
	"encoding/hex"
	"strings"
	"time"
)

const (
	kTokenLength    = 256 // token长度
	kSaltLength     = 32  // salt长度
	kUidLength      = 32  // uid长度
	kMaxSessionNum  = 1   // 最大同时登录设备数
	kMaxSessionHour = 72  // session有效时间
)

const AuthServiceName = "AuthService"

type AuthService struct {
	strGenerator stringUtil.StrGenerator
}

func (s *AuthService) SetupService() {
	s.strGenerator = stringUtil.StrGenerator{CharType: stringUtil.CharType_Pass, GenMode: stringUtil.GenMode_Each}
	s.strGenerator.Setup()
	db.GetConnection().Core.AutoMigrate(&userRecord{}, &sessionRecord{})
}

// 创建账户
func (s *AuthService) CreateUserRecord(username string, password string) bool {

	salt := s.genSalt()
	pass := CalculatePasswordWithSalt(password, salt)

	db.GetConnection().Core.Create(userRecord{
		Uid:      username,
		Salt:     salt,
		Password: pass,
	})
	return true
}

// 验证
func (s *AuthService) AuthUser(username string, password string, user *userRecord) bool {
	var dbUser userRecord
	ret := db.GetConnection().Core.Where("uid = ?", username).First(&dbUser)
	if ret.RowsAffected == 0 {
		return false
	}

	pass := CalculatePasswordWithSalt(password, dbUser.Salt)

	if dbUser.Password != pass {
		return false
	}

	*user = dbUser
	return true
}

// 登录
func (s *AuthService) Login(username string, password string, outToken *string) define.LogicErrorCode {
	var user userRecord
	if !s.AuthUser(username, password, &user) {
		return define.LEC_ERROR
	}

	// 超出最大登录数时清除掉旧的
	{
		var sessions []sessionRecord
		db.GetConnection().Core.Where("uid = ?", user.Uid).Order("t_expire").Find(&sessions)
		if length := len(sessions); length > kMaxSessionNum {
			deleteCount := length - kMaxSessionNum
			for idx, item := range sessions {
				if idx == deleteCount {
					break
				}
				db.GetConnection().Core.Delete(item)
			}
		}
	}

	// 创建新Session
	token := s.genToken()
	timeNow := time.Now()
	newSession := sessionRecord{
		Uid:        user.Uid,
		Token:      token,
		CreateTime: timeNow,
		ExpireTime: timeNow.Add(time.Hour * kMaxSessionHour),
	}
	db.GetConnection().Core.Create(&newSession)

	*outToken = token
	return define.LEC_OK
}

// 验证token
func (s *AuthService) AuthToken(username string, token string) bool {
	var session *sessionRecord
	db.GetConnection().Core.Where("token = ?", token).First(session)
	if session == nil {
		return false
	}

	if session.Uid != username {
		return false
	}

	return true
}

// 颁发新Token
func (s *AuthService) RenewToken(username string, oldToken string) define.LogicErrorCode {
	var session *sessionRecord
	db.GetConnection().Core.Where("token = ?", oldToken).First(session)
	if session == nil {
		return define.LEC_ERROR
	}

	// 复用原session
	session.Token = s.genToken()
	session.CreateTime = time.Now()
	session.ExpireTime = session.CreateTime.Add(time.Hour * kMaxSessionHour)

	db.GetConnection().Core.Save(&session)
	return define.LEC_OK
}

// 生成token
func (s *AuthService) genToken() string {
	return s.strGenerator.GenStr(kTokenLength)
}

// 生成盐
func (s *AuthService) genSalt() string {
	return s.strGenerator.GenStr(kSaltLength)
}

func CalculatePasswordWithSalt(raw string, salt string) string {
	var builder strings.Builder

	salt_rune := []rune(salt)
	rune_len := len(salt_rune)

	for i, r := range raw {
		builder.WriteRune(r)
		builder.WriteRune(salt_rune[i%rune_len])
	}

	src := builder.String()

	hash := sha256.New()
	hash.Write([]byte(src))
	return hex.EncodeToString(hash.Sum(nil))
}
