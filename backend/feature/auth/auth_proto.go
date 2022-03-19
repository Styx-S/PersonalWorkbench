package auth

import "PW/foundation/define"

type (
	LoginRequest struct {
		UserName string `json:"user_name"` // 用户名
		Password string `json:"password"`  // 密码
	}

	LoginResponse struct {
		Head  define.CommonResponse `json:"rsp"`
		Token string                `json:"token"`
	}
)
