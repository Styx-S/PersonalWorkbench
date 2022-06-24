
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workbench/page_utils/color_utils_page.dart';
import 'package:workbench/page_utils/time_utils_page.dart';

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

class _UtilsPage extends ConsumerStatefulWidget {

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UtilsPageState();
}

class _UtilsPageState extends ConsumerState<_UtilsPage> {

  PageSkeletonItemHelper itemHelper = PageSkeletonItemHelper();

  @override
  void initState() {
    super.initState();

    itemHelper.addBodyChangeItem("时间工具", (context) => const TimeUtilsPage());
    itemHelper.addBodyChangeItem("颜色工具", (context) => const ColorUtilsPage());

  }


  @override
  Widget build(BuildContext context) {
    final model = ref.watch(GlobalNavModel.provider).getModelByTag(context, GlobalNavModel.mainNav);
    return model!.makeNavPage((context){
      return PageSkeleton(
        verticalItems: itemHelper.items,
        bodyBuilder: (context){
          return itemHelper.makeBody(context);
        },
      );
    });
  }

}