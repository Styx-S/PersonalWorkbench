import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workbench/Foundations/foundations.dart';
import 'package:workbench/page_debug/debug_utils.dart';

import '../global_logic/global/global_nav_model.dart';

class MainPageConfig extends RouterPageConfig {

  static const tag = "/";

  @override
  String get title => "首页";

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

class _MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final model = ref.watch(GlobalNavModel.provider).getModelByTag(context, GlobalNavModel.mainNav);
    return model!.makeNavPage((context){
      return Container(color: Colors.blue,);
    });
  }

}