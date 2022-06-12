

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workbench/Foundations/foundations.dart';
import 'package:workbench/Foundations/widgets/button.dart';
import 'package:workbench/skeleton/logic/account/global_account_model.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _LoginPageState();
  
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return PageSkeleton(
          horizontalTitle: PWBSiteConfigWidget
              .configOf(context)
              .siteName,
          bodyBuilder: (context) {
            return Container(
              color: Colors.blue,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: 160,
                      child: LoginWidget(
                        actions: [
                          LoginAction(title: "登录", onTap: (){
                            ref.read(GlobalAccountModel.provider).login();
                          })
                        ],
                      ))
                ],
              ),
            );
          },
        );
  }
  
}


class LoginAction {
  final String title;
  final VoidCallback onTap;
  const LoginAction({required this.title, required this.onTap});
}

class LoginWidgetController {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get username => _usernameController.text;
  String get password => _passwordController.text;
}

class LoginWidget extends StatefulWidget {
  final double width;
  final List<LoginAction>? actions;
  final LoginWidgetController? controller;
  const LoginWidget({
    Key? key,
    this.width = 480,
    this.actions,
    this.controller,
  }) : super(key: key);



  @override
  State<StatefulWidget> createState() => _LoginWidgetState();

}

class _LoginWidgetState extends State<LoginWidget> {

  late LoginWidgetController controller;

  @override
  void initState() {
    super.initState();

    controller = widget.controller ?? LoginWidgetController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 300,
      decoration: BoxDecoration(
        color: context.colors.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildInputRow(context, "用户名"),
            const SizedBox(height: 20,),
            buildInputRow(context, "密码"),
            const SizedBox(height: 28,),
            if (widget.actions != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(widget.actions!.length, (index) {
                  final action = widget.actions![index];
                  return PWBButton(
                    title: action.title,
                    onTap: action.onTap,
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildInputRow(BuildContext context, String title) {
    return Row(
      children: [
        Text(title),
        const SizedBox(width: 12,),
        Expanded(child: TextField(maxLines: 1,),),
      ],
    );
  }

}