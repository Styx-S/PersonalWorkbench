

import 'package:flutter/material.dart';
import 'package:workbench/Foundations/foundations.dart';
import 'package:workbench/app.dart';

import '../skeleton/pages/main_page.dart';

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
  State<StatefulWidget> createState() => _DebugPageState();

}

class _DebugPageState extends State<_DebugPage> {
  PageSkeletonItemHelper itemHelper = PageSkeletonItemHelper();

  @override
  void initState() {
    super.initState();

    itemHelper.addBodyChangeItem("导航", Container(color: Colors.blue,));
    itemHelper.addBodyChangeItem("导航", Container(color: Colors.amber,));
    itemHelper.addBodyChangeItem("导航", Container(color: Colors.amberAccent,));
    itemHelper.addBodyChangeItem("导航", Container(color: Colors.amber,));
    itemHelper.addBodyChangeItem("导航", Container(color: Colors.amberAccent,));
    itemHelper.notify = (){
      setState((){});
    };
  }

  @override
  Widget build(BuildContext context) {

    return PageSkeleton(
      verticalTitle: "Console",
      verticalItems: itemHelper.items,
      verticalTitleTrailWidget: PWBResponder.builder(
        onTap: (){
          PWBRouterDelegate.of(context).pushPage(context, MainPageConfig.makeParam(), replace: true, useExist: true);
        },
        builder: (context) {
            return Icon(
              Icons.home,
              color: PWBResponderContext.of(context).on(normal: context.navColor.navForegroundColor, hover: context.navColor.hoverColor, press: context.navColor.pressColor),
            );
          },
      ),
      bodyBuilder: (context){
        return itemHelper.makeBody(context);
      },
    );

  }

}