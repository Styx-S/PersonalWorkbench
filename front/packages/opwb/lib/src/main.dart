import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opwb/src/page_container.dart';
import 'package:opwb/src/pages/login_page.dart';

import 'global/profile_bloc.dart';
import 'global/router_bloc.dart';
import 'global/view_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // 本地信息相关
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc(ProfileInitialState())),
        // 导航相关
        BlocProvider<RouterBloc>(create: (context) => RouterBloc(RouterState.fromStr(RouterDefineStr.kMainPage))),
        // 全局视图相关
        BlocProvider<ViewBloc>(create: (context) => ViewBloc(0),
        ),
      ],
      child: const MaterialApp(
        title: "工作台",
        home: AppBody(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, profileState) {
          // 未登录展示登录页
          if (profileState is ProfileInitialState) {
            return LoginPage();
          }
          else {
            return BlocBuilder<RouterBloc, RouterState>(
                builder: (context, router) {
                  final navigationBar = BlocProvider.of<ViewBloc>(context).navigationBar;
                  final routerStr = router.toString();
                  final sideBar = PageHelper.getSideBar(routerStr)?.call(context);
                  final body = PageHelper.getPage(routerStr)(context);
                  return PageContainer(navigationBar, sideBar, body);
                }
            );
          }
        });
  }

}
