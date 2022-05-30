
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opwb/src/global/profile_bloc.dart';
import 'package:opwb/src/global/router_bloc.dart';
import 'package:opwb/src/views/navigation_bar.dart';

abstract class ViewBlocEvent {}

class ViewBloc extends Bloc<ViewBlocEvent, int> {
  Widget navigationBar; // 导航栏：全站的导航栏是唯一的
  Widget? sideBar; // 在不同的Navigation下侧边栏应该不一致，有可能没有

  ViewBloc(int initialState)
      : navigationBar = NavigationBar(<NavigationItem>[
          NavigationItem.fromText("首页", onPress: (BuildContext context) {
            changeRouter(context, RouterDefineStr.kMainPage);
          }),
          NavigationItem.fromText("控制台", onPress: (BuildContext context) {
            changeRouter(context, RouterDefineStr.kNotFoundPage);
          }),
        ], <NavigationItem>[
          NavigationItem.fromText("登出", onPress: (BuildContext context) {
            final profileBloc = BlocProvider.of<ProfileBloc>(context);
            profileBloc.add(ProfileLogoutEvent());
          }),
        ]),
        super(initialState);

  static changeRouter(BuildContext context, String url) {
    final routerBloc = BlocProvider.of<RouterBloc>(context);
    routerBloc.add(RouterJumpEvent(RouterState.fromStr(url)));
  }

}
