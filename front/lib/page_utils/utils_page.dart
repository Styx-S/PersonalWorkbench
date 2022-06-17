
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Foundations/foundations.dart';
import '../global_logic/global/global_nav_model.dart';

class UtilsPageConfig extends RouterPageConfig {

  static const tag = "/utils";
  @override
  String get title => "工具";

  @override
  String get routerPath => tag;

  @override
  Widget routerEntry(PWBRouteParam param) {
    return _UtilsPage();
  }

  static PWBRouteParam makeParam() {
    return RouterDefine.getDefine().makeRouterParam(tag: tag);
  }
}

class _UtilsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final model = ref.watch(GlobalNavModel.provider).getModelByTag(context, GlobalNavModel.mainNav);
    return model!.makeNavPage((context){
      return Container();
    });
  }
}