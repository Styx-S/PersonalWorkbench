part of foundations;

class RouterDefine {

  static RouterDefine _define = RouterDefine();
  static RouterDefine getDefine() => _define;

  final Map<String, RouterPageConfig> _routerMap = {};
  RouterRedirectFunc? _notFoundFunc;

  void registerRoute(String route, RouterPageConfig config) {
    _routerMap[route] = config;
  }

  void registerNotFoundRedirectCb(RouterRedirectFunc func) {
    _notFoundFunc = func;
  }

  PWBRouteParam makeRouterParam<T>({ required String tag, Map<String, String>? param, T? data, String? raw}) {
    return PWBRouteParam(pageName: tag, queryParams: param, data: data, rawInfo: raw);
  }

}

typedef Widget RouterHandlerFunc(PWBRouteParam param);
typedef PWBRouteParam RouterRedirectFunc(RouteInformation info);

abstract class RouterPageConfig {
  String get routerPath;      // 获取页面对应路径
  bool get needLogin => true; // 是否需要登录才能访问
  Widget routerEntry(PWBRouteParam param);
}

class PWBRouteParam<T> {
  String pageName;
  Map<String,String>? queryParams;
  T? data;

  String? rawInfo;

  PWBRouteParam({
    required this.pageName,
    this.queryParams,
    this.data,
    this.rawInfo,
  });

  RouterPageConfig getConfig() {
    assert(RouterDefine.getDefine()._routerMap[pageName] != null);
    return RouterDefine.getDefine()._routerMap[pageName]!;
  }

  Widget getPage() {
    assert(RouterDefine.getDefine()._routerMap[pageName] != null);
    return getConfig().routerEntry(this);
  }

  String getRawUrl() {
    return rawInfo ?? pageName;
  }

}


class PWBRouteInfoParser extends RouteInformationParser<PWBRouteParam> {
  @override
  Future<PWBRouteParam> parseRouteInformation(RouteInformation routeInformation) async {

    PWBRouteParam make404 (){
      print("redirect to 404");
      assert(RouterDefine.getDefine()._notFoundFunc != null);
      return RouterDefine.getDefine()._notFoundFunc!(routeInformation);
    };

    if (routeInformation.location == null) {
      return make404();
    }

    final uri = Uri.parse(routeInformation.location!);
    final routePage = uri.path;
    print("${routePage} ${uri.queryParameters}");

    if (!RouterDefine.getDefine()._routerMap.containsKey(routePage)) {
      return make404();
    }

    return PWBRouteParam(pageName: routePage, queryParams: uri.queryParameters, data: routeInformation.state, rawInfo: routeInformation.location);
  }

  @override
  RouteInformation? restoreRouteInformation(PWBRouteParam configuration) {
    final info = RouteInformation(location: configuration.getRawUrl());
    return info;
  }

}