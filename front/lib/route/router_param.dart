import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:workbench/route/router_define.dart';

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


  Widget getPage() {
    assert(RouterDefine.getDefine().routerMap[pageName] != null);
    return RouterDefine.getDefine().routerMap[pageName]!.routerEntry(this);
  }

}


class PWBRouteInfoParser extends RouteInformationParser<PWBRouteParam> {
  @override
  Future<PWBRouteParam> parseRouteInformation(RouteInformation routeInformation) async {

    print("parse info: ${routeInformation.location} state: ${routeInformation.state}");
    final make404 = (){
      print("redirect to 404");
      return PWBRouteParam(pageName: RouterDefine.notFound, rawInfo: routeInformation.location);
    };

    if (routeInformation.location == null) {
      return make404();
    }

    final uri = Uri.parse(routeInformation.location!);
    final routePage = uri.path;
    print("${routePage} ${uri.queryParameters}");

    if (!RouterDefine.getDefine().routerMap.containsKey(routePage)) {
      return make404();
    }

    return PWBRouteParam(pageName: routePage, queryParams: uri.queryParameters, data: routeInformation.state, rawInfo: routeInformation.location);
  }

  @override
  RouteInformation? restoreRouteInformation(PWBRouteParam configuration) {
    final info = RouteInformation(location: configuration.rawInfo ?? configuration.pageName);
    print("restore info: ${info.location}");
    return info;
  }

}