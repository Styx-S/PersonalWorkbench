
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Foundations/foundations.dart';

class TimeTransformWidget extends StatefulWidget {
  const TimeTransformWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimeTransformWidgetState();

}

class _TimeTransformWidgetState extends State<TimeTransformWidget> {

  TextEditingController controller = TextEditingController();
  TextEditingController retController = TextEditingController();

  final formatter = DateFormat("yy-MM-dd HH:mm:ss.ms");

  @override
  void initState() {
    super.initState();

    controller.text = "1655370350";
    controller.addListener(() {
      setState((){
        doTransform();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    retController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 160,
          height: 28,
          child: TextField(
            decoration: TextFieldUtils.makeDecoration(),
            controller: controller,
          ),
        ),

        SizedBox(
          width: 160,
          height: 40,
          child: TextField(
            decoration: TextFieldUtils.makeDecoration(),
            style: TextStyle(
              fontSize: 14,
              color: context.colors.textL1TitleColor,
            ),
            controller: retController,
          ),
        ),
      ],
    );
  }

  void doTransform() {
    final rawStr = controller.text;
    int? timestamp;
    try {
      timestamp = int.parse(rawStr);
    } catch(e) {
      print(e);
    }
    if (timestamp == null) {
      return;
    }
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    retController.text = formatter.format(time);
  }
}