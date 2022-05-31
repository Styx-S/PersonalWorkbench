
import 'package:flutter/cupertino.dart';
import 'package:workbench/pages/main_page.dart';
import 'package:workbench/pages/not_found_page.dart';
import 'package:workbench/route/router_param.dart';

class RouterDefine {

  static const notFound = NotFoundPageConfig.tag;

  static RouterDefine _define = RouterDefine();
  static RouterDefine getDefine() => _define;

  final Map<String, RouterPageConfig> routerMap = {
    NotFoundPageConfig.tag: NotFoundPageConfig(),
    MainPageConfig.tag: MainPageConfig(),
  };
}

typedef Widget RouterHandlerFunc(PWBRouteParam param);

abstract class RouterPageConfig {
  Widget routerEntry(PWBRouteParam param);
}