
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:workbench/route/router_delegate.dart';
import 'package:workbench/route/router_param.dart';

void main() {
  runApp(WorkbenchApp());
}


class WorkbenchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Workbench",
      routeInformationParser: PWBRouteInfoParser(),
      routerDelegate: PWBRouteInfoDelegate());
  }

}

