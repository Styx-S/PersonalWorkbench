import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workbench/global/profile_bloc.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF282F3D),
      child: Row(
        children: [
          Expanded(child: Container(),),
          TextButton(onPressed: (){
            final profileBloc = BlocProvider.of<ProfileBloc>(context);
            profileBloc.add(ProfileLogoutEvent());
          }, child: Text("登出"))
        ],
      ),
    );
  }
}