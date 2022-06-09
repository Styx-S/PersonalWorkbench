import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workbench/Foundations/foundations.dart';

class NotFoundPageConfig extends RouterPageConfig {
  static const tag = "/404";

  @override
  String get routerPath => tag;

  @override
  Widget routerEntry(PWBRouteParam param) {
    return _NotFoundPage();
  }

  static PWBRouteParam makeParam(String? rawUrl) {
    return RouterDefine.getDefine().makeRouterParam(tag: tag, raw: rawUrl);
  }
  
}

class _NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text("404", style: TextStyle(color: Colors.blue),),
      ),
    );
  }

}