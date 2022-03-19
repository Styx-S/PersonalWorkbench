package define

import "github.com/gin-gonic/gin"

type (
	ResponseErrorCode int32
	CommonResponse    struct {
		RetCode ResponseErrorCode `json:"ret_code"` // 错误码，0为成功
		RetMsg  string            `json:"ret_msg"`  // 错误信息
	}
)

type Handler interface {
	Setup(engine *gin.Engine)
}

type Service interface {
	SetupService()
}

type Manager interface {
}
