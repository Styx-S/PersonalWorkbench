part of foundations;

class NetworkClient {
  final String host;
  final int port;
  final HttpClient _client = HttpClient();

  NetworkClient({
    required this.host,
    required this.port,
  });
  
  Future<PWBResponse> doRequest(String target, PWBRequest request) async {
    final httpRequest = await _client.post(host, port, target);
    request.requestTime = wrapTransportNum(DateTime.now().millisecondsSinceEpoch);
    httpRequest.add(request.writeToBuffer());
    final httpResponse = await httpRequest.close();
    if (httpResponse.statusCode != HttpStatus.ok) {
      final response = PWBResponse();
      response.transportError = PWBError()..errCode = httpResponse.statusCode;
      return response;
    }

    List<int> list = [];
    await for (final i in httpResponse) {
      list += i;
    }
    final response = PWBResponse.fromBuffer(list);
    return response;
  }
}


