import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workbench/global/profile_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }

}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: const Text("点击登录"),
          onTap: (){
            _login(context);
          },
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    final profileBloc = BlocProvider.of<ProfileBloc>(context);

    profileBloc.add(ProfileLoginEvent("username", "password"));
  }
}