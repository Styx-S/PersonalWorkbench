

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalAccountModel extends ChangeNotifier {
  static final provider = ChangeNotifierProvider((_) => GlobalAccountModel._());

  GlobalAccountModel._();

  bool _isLogin = false;
  bool get isLogin => _isLogin;

  void login() {
    _isLogin = true;
    notifyListeners();
  }


}