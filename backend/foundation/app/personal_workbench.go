package app

import (
	"PW/foundation/db"
	"PW/foundation/define"

	"github.com/gin-gonic/gin"
)

type ServiceInitFunc func(serviceList *[]define.Service)
type HandlerInitFUnc func(handlerList *[]define.Handler)

type PersonalWorkbenchApp struct {
	GinEngine   *gin.Engine
	AllHandlers []define.Handler
	AllServices []define.Service
}

var AppInstance PersonalWorkbenchApp

func (app *PersonalWorkbenchApp) Setup(serviceInit ServiceInitFunc, handlerInit HandlerInitFUnc) {
	// 初始化数据库
	db.SetupDBConnection()
	// 初始化Service逻辑
	app.doServiceInit(serviceInit)

	// 初始化路由
	app.GinEngine = gin.Default()
	// 初始化Handler
	app.doHanlderInit(handlerInit)

}

func (app *PersonalWorkbenchApp) Run() {
	app.GinEngine.Run()
}

func (app *PersonalWorkbenchApp) doServiceInit(initFunc ServiceInitFunc) {
	app.AllServices = make([]define.Service, 0)

	initFunc(&app.AllServices)

	for _, service := range app.AllServices {
		service.SetupService()
	}
}

func (app *PersonalWorkbenchApp) doHanlderInit(initFunc HandlerInitFUnc) {
	app.AllHandlers = make([]define.Handler, 0)

	initFunc(&app.AllHandlers)

	for _, handler := range app.AllHandlers {
		handler.Setup(app.GinEngine)
	}
}

// Service互相调用工具方法
func HelpGetService[T interface{}](app *PersonalWorkbenchApp, outService *T) bool {
	for _, svr := range app.AllServices {
		target, ok := svr.(T)
		if ok {
			*outService = target
			return true
		}
	}
	return false
}
