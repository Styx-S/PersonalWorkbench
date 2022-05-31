import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workbench/route/router_define.dart';
import 'package:workbench/route/router_param.dart';

class NotFoundPageConfig extends RouterPageConfig {
  static const tag = "/404";

  @override
  Widget routerEntry(PWBRouteParam param) {
    return _NotFoundPage();
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