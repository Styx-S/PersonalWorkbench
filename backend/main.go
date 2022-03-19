package main

import (
	"PW/feature/auth"
	"PW/foundation/app"
	"PW/foundation/define"
)

func main() {

	// 解Service和App之间的循环引用
	app.AppInstance.Setup(func(serviceList *[]define.Service) {

		*serviceList = append(*serviceList, &auth.AuthService{})

	}, func(handlerList *[]define.Handler) {

		*handlerList = append(*handlerList, &auth.AuthHandler{})

	})

	var a *auth.AuthService
	app.HelpGetService(&app.AppInstance, &a)
	app.AppInstance.Run()
}
