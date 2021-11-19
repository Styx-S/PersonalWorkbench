
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workbench/views/navigation_bar.dart';
import 'package:workbench/page_container.dart' as wp;

abstract class ViewBlocEvent {

}

class ViewBloc extends Bloc<ViewBlocEvent,int> {
  Widget  navigationBar; // 导航栏：全站的导航栏是唯一的
  Widget? sideBar; // 在不同的Navigation下导航栏应该不一致，有可能没有

  ViewBloc(int initialState)
      : navigationBar = NavigationBar(),
        super(initialState);
}