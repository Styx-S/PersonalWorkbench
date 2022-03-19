package define

type LogicErrorCode int64

const (
	// OK
	LEC_OK = 0

	// Common
	LEC_ERROR              = -1 // 未知错误
	LEC_PARAMERTER_ERROR   = 1  // 参数错误
	LEC_CALL_SERVICE_ERROR = 2  // Service调用错误

	// Auth
)
