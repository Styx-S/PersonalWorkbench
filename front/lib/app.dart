import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workbench/skeleton/logic/account/global_account_model.dart';
import 'package:workbench/skeleton/pages/login_page.dart';

import 'Foundations/foundations.dart';

class PWBRouterDelegate extends RouterDelegate<PWBRouteParam> {

  final List<PWBRouteParam> _routeStack = [];
  final List<VoidCallback> _listeners = [];

  @override
  void addListener(listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(listener) {
    _listeners.remove(listener);
  }

  void notifyListeners() {
    for (final l in _listeners) {
      l();
    }
  }

  static PWBRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert (delegate is PWBRouterDelegate);
    return delegate as PWBRouterDelegate;
  }

  void pushPage(BuildContext context, PWBRouteParam param) {
    _routeStack.add(param);
    notifyListeners();
  }

  bool popPage() {
    if (_routeStack.length <= 1) {
      return false;
    }
    _routeStack.removeLast();
    notifyListeners();
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
          if (currentConfiguration == null) {
            return Container();
          }
          final pageConfig = currentConfiguration!.getConfig();
          if (pageConfig.needLogin && !ref.watch(GlobalAccountModel.provider).isLogin) {
            return const LoginPage();
          }
          return Scaffold(
            body: currentConfiguration!.getPage(),
          );
    });

  }

  @override
  Future<bool> popRoute() {
    print("pop route, curr is ${currentConfiguration?.pageName ?? "null" }");
    if (_routeStack.isEmpty) {
      return SynchronousFuture(false);
    }
    _routeStack.removeLast();
    notifyListeners();
    return SynchronousFuture(true);
  }

  @override
  Future<void> setNewRoutePath(PWBRouteParam param) {
    print("new route: ${param.pageName}");
    _routeStack.clear();
    _routeStack.add(param);
    notifyListeners();
    return SynchronousFuture<void>(null);
  }

  @override
  PWBRouteParam? get currentConfiguration => _routeStack.isNotEmpty ? _routeStack.last : null;

}