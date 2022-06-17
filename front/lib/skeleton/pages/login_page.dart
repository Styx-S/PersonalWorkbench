

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workbench/Foundations/foundations.dart';
import 'package:workbench/global_logic/global/global_account_model.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _LoginPageState();
  
}

class _LoginPageState extends ConsumerState<LoginPage> {

  final loginController = LoginWidgetController();

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
                        controller: loginController,
                        actions: [
                          LoginAction(title: "登录", onTap: (){
                            ref.read(GlobalAccountModel.provider).login(loginController.username, loginController.password);
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
  Widget build(context) {

    // 每行输入框期望长度对齐
    final List<String> titles = ["用户名", "密码"];
    const titleStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    );
    // 第一次启动的时候会触发两次build，计算出来的宽度会变，不知道为啥
    // final Iterable<double> titleWidths = titles.map((e) => StringUtils.getTextSize(e, titleStyle, maxLines: 1).width);
    // var suitableTitleWidth = titleWidths.first;
    // const spaceBtwTitleAndContent = 20;
    // for (final w in titleWidths) {
    //   if (w + spaceBtwTitleAndContent > suitableTitleWidth) {
    //     suitableTitleWidth = w + spaceBtwTitleAndContent;
    //   }
    // }
    const suitableTitleWidth = 92.0;


    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        color: context.colors.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 60, bottom: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildInputRow(context, titleWidth: suitableTitleWidth, title: titles[0], controller: controller._usernameController),
            const SizedBox(height: 20,),
            buildInputRow(context, titleWidth: suitableTitleWidth, title: titles[1], controller: controller._passwordController, isPassword: true),
            const SizedBox(height: 36,),
            if (widget.actions != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(widget.actions!.length, (index) {
                  final action = widget.actions![index];
                  return PWBButton(
                    width: actionButtonWidth(),
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

  Widget buildInputRow(BuildContext context, {
    required double titleWidth,
    required String title,
    TextEditingController? controller,
    bool isPassword = false,
  }) {
    return Row(
      children: [
        SizedBox(
          width: titleWidth,
          child: Text(title),
        ),
        Expanded(child: TextField(
          obscureText: isPassword,
          maxLines: 1,
          controller: controller,
          decoration: TextFieldUtils.makeDecoration(),
        ),),
      ],
    );
  }

  double? actionButtonWidth() {
    final num = widget.actions?.length ?? 0;
    if (num == 1) {
      return 400;
    }
    return null;
  }

}