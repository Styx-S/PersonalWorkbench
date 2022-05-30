

import 'dart:core';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(ProfileState initialState) : super(initialState) {
    on<ProfileLoginEvent>(_login);
    on<ProfileLogoutEvent>(_logout);
  }

  // 登录
  void _login(ProfileLoginEvent loginEvent, Emitter<ProfileState> emit) async {
    // 现在直接登录
    emit(ProfileNormalState());
  }

  // 登出
  void _logout(ProfileLogoutEvent logoutEvent, Emitter<ProfileState> emit) async {
    emit(ProfileInitialState());
  }

}

abstract class ProfileEvent {

}

class ProfileLoginEvent extends ProfileEvent {
  String username;
  String password;
  ProfileLoginEvent(this.username, this.password);
}

class ProfileLogoutEvent extends ProfileEvent {

}

abstract class ProfileState {

}

// 初始状态，没有登陆信息
class ProfileInitialState extends ProfileState {

}

// 正常状态
class ProfileNormalState extends ProfileState {

}