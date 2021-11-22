
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/*
  注意这里所有的Router都是指逻辑上的
  整个应用在网页url上只有一个，不进行区分(目前没找到好的方式)
 */

abstract class RouterEvent {

}

class RouterState {
  final String? category;   // 一级分类
  final String? key;        // 二级分类
  final String? item;       // 最终定位
  String? routeStr;

  RouterState({
    this.category,
    this.key,
    @required this.item, this.routeStr});

  factory RouterState.fromStr(String routeStr) {
    var category = "";
    var key = "";
    var item = "";

    const kSeperator = "/";
    if (routeStr.contains(kSeperator)) {
      if (routeStr != kSeperator) {
        final ss = routeStr.split("/");

        item = ss.last;
        ss.removeLast();
        key = ss.last;
        ss.removeLast();
        if (ss.isNotEmpty) {
          category = ss.last;
        }
      }
    }

    print("str: $routeStr | category: $category, key: $key, item: $item");
    final router = RouterState(category: category, key: key, item: item, routeStr: routeStr);
    return router;
  }

  @override
  String toString() {
    if (routeStr != null) {
      return routeStr!;
    }

    String ss = "";
    if (category != null && category!.isNotEmpty) {
      ss += "/${category!}";
    }
    if (key != null && key!.isNotEmpty) {
      ss += "/${key!}";
    }
    if (item != null && item!.isNotEmpty) {
      ss += "/${item!}";
    }

    if (ss.isEmpty) {
      ss = "/";
    }

    routeStr = ss;
    return ss;
  }
}

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc(RouterState initialState) : super(initialState);
}

class RouterDefineStr {
  static const kMainPage = "/";
  static const kLoginPage = "/login";
  static const kNotFoundPage = "/404";
}