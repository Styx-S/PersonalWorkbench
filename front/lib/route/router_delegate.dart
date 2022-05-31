
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:workbench/route/router_param.dart';

class PWBRouteInfoDelegate extends RouterDelegate<PWBRouteParam> {

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
    print("notify listeners, count: ${_listeners.length}");
    for (final l in _listeners) {
      l();
    }
  }


  @override
  Widget build(BuildContext context) {
    if (currentConfiguration == null) {
      return Container(
        child: Align(
          child: Text("加载中..."),
        ),
      );
    }
    return currentConfiguration!.getPage();
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
    _routeStack.add(param);
    notifyListeners();
    return SynchronousFuture<void>(null);
  }

  @override
  PWBRouteParam? get currentConfiguration => _routeStack.isNotEmpty ? _routeStack.last : null;

}