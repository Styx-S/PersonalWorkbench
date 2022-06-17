part of foundations;

abstract class NetworkDispatcherDelegate {
  PWBToken? getToken();
}

class NetworkDispatcher {
  static final NetworkDispatcher _dispatcher = NetworkDispatcher._();
  static NetworkDispatcher get instance => _dispatcher;
  NetworkDispatcher._();

  int seq = 0;

  NetworkDispatcherDelegate? delegate;

  // 登录单独处理
  Future<NetworkResult<LoginRsp>> doLoginRequest(LoginReq req) async {
    return _request<LoginReq, LoginRsp>(NetworkCmdMap.login, req, ignoreLogin: true,
        serializer:  (p0) => LoginRsp.fromBuffer(p0)
    );
  }

  Future<NetworkResult<O>> doRequest<I extends $pb.GeneratedMessage, O extends $pb.GeneratedMessage>(String target, I reqBody, {
    required NetworkPBSerializer<O> serializer,
  }) async {
    return _request(target, reqBody, serializer: serializer);
  }

  Future<NetworkResult<O>> _request<I extends $pb.GeneratedMessage, O extends $pb.GeneratedMessage>(String target, I reqBody, {
    required NetworkPBSerializer<O> serializer,
    bool ignoreLogin = false,
  }) async {
    if (!ignoreLogin && (delegate == null || delegate!.getToken() == null)) {
      return const NetworkResult(status: NetworkResultStatus.businessError, errCode: NetworkResult.noLogin);
    }
    final client = getClient();
    final requestBody = PWBRequest();
    final token = delegate!.getToken();
    if (token != null) {
      requestBody.authToken = token;
    }
    requestBody.requestSeq = wrapTransportNum(seq);
    final response = await client.doRequest(target, requestBody);
    final rspStatus = helpStatus(response);
    final rspError = helpError(response, rspStatus);
    return NetworkResult(
      rsp: response.hasResponsePayload() ? serializer(response.responsePayload) : null,
      status: helpStatus(response),
      errCode: rspError?.errCode ?? 0,
      errMsg: rspError?.errMsg ?? "",
    );
  }

  NetworkClient getClient() {
    return NetworkClient(host: PWBSiteConfig.host, port: PWBSiteConfig.port);
  }

  static NetworkResultStatus helpStatus(PWBResponse rsp) {
    if (rsp.hasTransportError()) {
      return NetworkResultStatus.networkError;
    }
    if (rsp.hasBusinessError()) {
      return NetworkResultStatus.businessError;
    }
    return NetworkResultStatus.ok;
  }

  static PWBError? helpError(PWBResponse rsp, NetworkResultStatus status) {
    if (status == NetworkResultStatus.networkError) {
      return rsp.transportError;
    }
    else if (status == NetworkResultStatus.businessError) {
      return rsp.businessError;
    }
    return null;
  }
}