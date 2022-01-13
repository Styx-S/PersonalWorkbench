
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/*
  注意这里所有的Router都是指逻辑上的
  整个应用在网页url上只有一个，不进行区分(目前没找到好的方式)
 */

abstract class RouterEvent {

}

class RouterJumpEvent extends RouterEvent {
  RouterState newRouteState;
  RouterJumpEvent(this.newRouteState);
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
  RouterBloc(RouterState initialState) : super(initialState) {
    on<RouterJumpEvent>(_handleRoute);
  }

  void _handleRoute(RouterJumpEvent jumpEvent, Emitter<RouterState> emit) async {
    emit(jumpEvent.newRouteState);
  }
}

class RouterDefineStr {
  // static const kLoginPage = "/login";// 不需要登录页的url，通过profileBloc登出自动跳转
  static const kMainPage = "/";
  static const kNotFoundPage = "/404";
}