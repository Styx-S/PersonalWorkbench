import 'package:flutter/material.dart';
import 'package:workbench/Foundations/foundations.dart';
import 'package:workbench/page_debug/debug_utils.dart';

class MainPageConfig extends RouterPageConfig {

  static const tag = "/";

  @override
  String get routerPath => tag;

  @override
  Widget routerEntry(PWBRouteParam param) {
    return _MainPage();
  }

  static PWBRouteParam makeParam() {
    return RouterDefine.getDefine().makeRouterParam(tag: tag);
  }
}

class _MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final debugHandler = DebugGestureHandler(context);
    return Column(
      children: [
        PWBHorizontalNavigationBar(
          logoText: "PersonalWorkbench",
          logoTap: debugHandler.onTap,
          onNavChanged: <String>(id){
          print("${id}");
        },
          items: List.generate(5, (index) => PWBNavigationItem(id: "${index}", title: "导航"))
        ),
        Expanded(child: Row(children: [Expanded(child: Container(color: context.colors.backgroundColor,))],)),
      ],
    );
  }

}