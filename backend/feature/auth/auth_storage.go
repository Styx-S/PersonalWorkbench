package auth

import "time"

type userRecord struct {
	Uid      string `gorm:"column:uid;primary_key;INDEX"` // 用户名
	Salt     string `gorm:"column:salt"`                  // 盐
	Password string `gorm:"column:password"`              // 口令
}

func (userRecord) TableName() string {
	return "user_record"
}

type sessionRecord struct {
	SessionId  int64     `gorm:"column:session_id;primary_key;AUTO_INCREMENT;UNIQUE_INDEX"` // sessionId
	Uid        string    `gorm:"column:uid;INDEX"`                                          // uid
	Token      string    `gorm:"column:token"`                                              // token值（对外暴露）
	CreateTime time.Time `gorm:"column:t_create"`                                           // 创建时间
	ExpireTime time.Time `gorm:"column:t_expire"`                                           // 过期时间
}

func (sessionRecord) TableName() string {
	return "session_record"
}
