part of foundations;

enum NetworkResultStatus {
  ok,
  networkError,
  businessError,
}

class NetworkResult<T> {
  final T? rsp;
  final NetworkResultStatus status;
  final int errCode;
  final String errMsg;
  const NetworkResult({
    this.rsp,
    this.status = NetworkResultStatus.ok,
    this.errCode = 0,
    this.errMsg = ""
  });

  bool get logicOK => status == NetworkResultStatus.ok && rsp != null;

  static const int noLogin = 1001;  // 无登录态
}

typedef NetworkPBSerializer<T extends $pb.GeneratedMessage> = T? Function(List<int> bytes);

class NetworkCmdMap {
  static const login = "/auth";
}

$fixnum.Int64 wrapTransportNum(int i) => $fixnum.Int64(i);