package auth

import (
	"PW/foundation/app"
	"PW/foundation/define"

	"github.com/gin-gonic/gin"
)

type RequestAuthMiddleware struct {
}

const (
	kActionAccept       = 0 // 正常访问
	kActionRefuse       = 1 // 登录校验失败
	kActionUnknowClient = 2 // 非指定客户端
)

func (auth *RequestAuthMiddleware) handle(c *gin.Context) {

	var header = c.Request.Header
	var actionType = kActionAccept

	for {
		// 如果不含有预定义KV，说明不是指定客户端，先过滤掉
		pd := header.Get(define.HeaderPreDefineKey)
		if pd != define.HeaderPreDefineDefaultValue {
			actionType = kActionUnknowClient
			break
		}

		var authService *AuthService
		if !app.HelpGetService(&app.AppInstance, &authService) {
			actionType = kActionRefuse
			break
		}

		username := header.Get(define.HeaderUsernameKey)
		token := header.Get(define.HeaderTokenKey)
		if !authService.AuthToken(username, token) {
			actionType = kActionRefuse
			break
		}

		break
	}

	switch actionType {
	case kActionAccept:
		c.Next()
	case kActionUnknowClient:
		c.Abort()
	default:
		c.Abort()
	}

}
