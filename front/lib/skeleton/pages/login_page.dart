

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workbench/skeleton/logic/account/global_account_model.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _LoginPageState();
  
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        ref.read(GlobalAccountModel.provider).login();
      },
      child: Container(color: Colors.blue,),
    );
  }
  
}