package auth

import (
	"PW/foundation/app"
	"PW/foundation/define"
	"net/http"

	"github.com/gin-gonic/gin"
)

type AuthHandler struct {
}

func (handler *AuthHandler) Setup(engine *gin.Engine) {
	engine.POST("login", HandleLoginReq)
	engine.POST("register", HandleRegisterReq)
}

func HandleLoginReq(ctx *gin.Context) {
	var req LoginRequest
	err := ctx.ShouldBind(&req)
	if err != nil {
		ctx.JSON(http.StatusOK, LoginResponse{
			define.BindErrorRsp(), "",
		})
		return
	}

	var service *AuthService
	if !app.HelpGetService(&app.AppInstance, &service) {
		ctx.JSON(http.StatusOK, LoginResponse{
			define.FindServiceErrorRsp(), "",
		})
		return
	}

	var token string
	ret := service.Login(req.UserName, req.Password, &token)
	if ret != define.LEC_OK {
		ctx.JSON(http.StatusOK, LoginResponse{
			define.SimpleErrorRsp(), "",
		})
		return
	}

	ctx.JSON(http.StatusOK, LoginResponse{
		define.NoErrorRsp(), token,
	})

}

func HandleRegisterReq(ctx *gin.Context) {
	var req LoginRequest
	err := ctx.ShouldBind(&req)
	if err != nil {
		ctx.JSON(http.StatusOK, define.ErrorRsp(-1, ""))
		return
	}

	var service *AuthService
	if !app.HelpGetService(&app.AppInstance, &service) {
		ctx.JSON(http.StatusOK, LoginResponse{
			define.ErrorRsp(-1, ""), "",
		})
		return
	}

	ret := service.CreateUserRecord(req.UserName, req.Password)
	if !ret {

	}

	ctx.JSON(http.StatusOK, define.NoErrorRsp())
}
