
import 'package:flutter/material.dart';
import 'package:workbench/skeleton/pages/debug_page.dart';
import 'package:workbench/skeleton/pages/main_page.dart';
import 'package:workbench/skeleton/pages/not_found_page.dart';
import 'Foundations/foundations.dart';
import 'app.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AppState();

}

class _AppState extends State<App> {

  final PWBRouteInfoParser parser = PWBRouteInfoParser();
  final PWBRouterDelegate delegate = PWBRouterDelegate();

  @override
  void initState() {
    super.initState();

    final routerConfigs = [
      NotFoundPageConfig(),
      MainPageConfig(),
      DebugPageConfig(),
    ];
    for (final config in routerConfigs) {
      RouterDefine.getDefine().registerRoute(config.routerPath, config);
    }

    RouterDefine.getDefine().registerNotFoundRedirectCb((info) {
      return NotFoundPageConfig.makeParam(info.location);
    });
  }

  App of(BuildContext context) {
    final app = context.findAncestorWidgetOfExactType<App>();
    assert(app != null);
    return app!;
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: null,
        title: "Workbench",
        routeInformationParser: parser,
        routerDelegate: delegate);
  }

}
