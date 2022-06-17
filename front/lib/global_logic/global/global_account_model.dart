

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proto/proto/base/request.pb.dart';
import 'package:workbench/Foundations/foundations.dart';

class GlobalAccountModel extends ChangeNotifier implements NetworkDispatcherDelegate {
  static final provider = ChangeNotifierProvider((_) => GlobalAccountModel._());

  GlobalAccountModel._() {
    NetworkDispatcher.instance.delegate = this;
  }

  bool _isLogin = false;
  bool get isLogin => _isLogin;
  PWBToken? _token;

  void login(String username, String password) {
    _isLogin = true;
    notifyListeners();
  }

  void logout() {
    _isLogin = false;
    notifyListeners();
  }

  @override
  PWBToken? getToken() => _token;

}