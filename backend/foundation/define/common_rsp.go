package define

func NoErrorRsp() CommonResponse {
	return CommonResponse{RetCode: 0, RetMsg: "ok"}
}

func ErrorRsp(retCode ResponseErrorCode, retMsg string) CommonResponse {
	return CommonResponse{RetCode: retCode, RetMsg: retMsg}
}

func SimpleErrorRsp() CommonResponse {
	return ErrorRsp(LEC_ERROR, "Invalid")
}

// cgi取参数错误
func BindErrorRsp() CommonResponse {
	return ErrorRsp(LEC_PARAMERTER_ERROR, "can't parse req data")
}

// 找不到handler对应Service
func FindServiceErrorRsp() CommonResponse {
	return ErrorRsp(LEC_CALL_SERVICE_ERROR, "can't find corresponding service")
}
