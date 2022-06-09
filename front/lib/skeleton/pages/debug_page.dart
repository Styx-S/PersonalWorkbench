

import 'package:flutter/cupertino.dart';
import 'package:workbench/Foundations/foundations.dart';

class DebugPageConfig extends RouterPageConfig {

  static const tag = "/debug";

  @override
  String get routerPath => tag;

  @override
  Widget routerEntry(PWBRouteParam param) {
    return _DebugPage();
  }

  static PWBRouteParam makeParam() {
    return RouterDefine.getDefine().makeRouterParam(tag: tag);
  }
}

class _DebugPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}