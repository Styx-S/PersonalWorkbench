
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workbench/global_logic/global/global_site_model.dart';
import 'package:workbench/page_debug/debug_page.dart';
import 'package:workbench/page_main/main_page.dart';
import 'package:workbench/page_utils/utils_page.dart';
import 'package:workbench/skeleton/pages/not_found_page.dart';
import 'Foundations/foundations.dart';
import 'app.dart';

void main() {
  runApp(App.obtainRootWidget());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  static Widget obtainRootWidget() {
    return const ProviderScope(child: PWBSiteConfigWidget(
      siteConfig: PWBSiteConfig(
        siteName: "PersonalWorkbench",
      ),
      child: App(),
    ));
  }

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
      UtilsPageConfig(),
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
    return GlobalSiteModel.makeConfigBuilder((context, config) {
      return MaterialApp.router(
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          themeMode: null,
          title: config.siteName,
          routeInformationParser: parser,
          routerDelegate: delegate
      );
    });
  }

}
