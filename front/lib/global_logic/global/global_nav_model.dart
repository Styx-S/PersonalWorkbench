
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workbench/app.dart';
import 'package:workbench/page_main/main_page.dart';
import 'package:workbench/page_utils/utils_page.dart';

import '../../Foundations/foundations.dart';
import '../../page_debug/debug_utils.dart';

class GlobalNavModel extends ChangeNotifier {
  static final provider = ChangeNotifierProvider((_) => GlobalNavModel._());

  GlobalNavModel._();

  static const mainNav = "mainNav";
  Map<String, NavModel> modelsMap = {};

  static const _debugHandlerKey ="debug_handler";

  NavModel? getModelByTag(BuildContext context, String tag, {String? currId}) {
    late NavModel model;
    if (modelsMap.containsKey(tag)) {
      model = modelsMap[tag]!;
      model.setContextIfNeed?.call(model, context);
    }
    else {
      final r = GlobalNavModelFactory.tryMakeModel(context, tag);
      if (r != null) {
        model = r;
        modelsMap[tag] = r;
      } else {
        model = GlobalNavModelFactory.guardModel(context);
      }
    }

    if (currId != null) {
      model.selectPageWithId(currId);
    }

    return model;
  }
}


class GlobalNavModelFactory {
  static NavModel? tryMakeModel(BuildContext context, String tag) {

    if (tag == GlobalNavModel.mainNav) {
      return makeMainModel(context);
    }

    return null;
  }

  static NavModel guardModel(BuildContext context) {
    final model = NavModel(pages: [], convertFirst2Logo: true);
    model.pages.add(NavItem("", () => throw Error()));
    return model;
  }
  
  static NavModel makeMainModel(BuildContext context) {

    final model = NavModel(pages: [], convertFirst2Logo: true);

    model.setContextIfNeed = (model, context){
      // 用来实现依赖context的方法
      model.args[GlobalNavModel._debugHandlerKey] = DebugGestureHandler(context);
    };
    model.setContextIfNeed!(model, context);
    final items = model.pages;

    final debug = DebugGestureHandler(context);
    items.add(NavItem("", () => MainPageConfig.makeParam(), tapHandle: (){
      (model.args[GlobalNavModel._debugHandlerKey] as DebugGestureHandler).onTap();
    }, id: MainPageConfig.tag));
    items.add(NavItem("工具", () => UtilsPageConfig.makeParam(), id: UtilsPageConfig.tag));
    return model;
  }
}