import 'package:flutter/material.dart';
import 'package:workbench/route/router_define.dart';
import 'package:workbench/route/router_param.dart';

class MainPageConfig extends RouterPageConfig {

  static const tag = "/";

  @override
  Widget routerEntry(PWBRouteParam param) {
    return _MainPage();
  }

}

class _MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }

}