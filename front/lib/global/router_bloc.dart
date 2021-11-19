
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RouterEvent {

}

class RouterState {
  String? category;   // 一级分类
  String? key;        // 二级分类
  String? item;       // 最终定位

  RouterState({
    this.category,
    this.key,
    @required this.item});

  static RouterState kDefaultRouter = RouterState(item: "/");
}

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc(RouterState initialState) : super(initialState);
}