
import 'package:flutter/material.dart';
import 'package:workbench/Foundations/foundations.dart';
import 'package:workbench/page_utils/widget/time_transform_widget.dart';

class TimeUtilsPage extends StatefulWidget {
  const TimeUtilsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimeUtilsPageState();

}

class _TimeUtilsPageState extends State<TimeUtilsPage> {
  @override
  Widget build(BuildContext context) {
    return AdaptivePage(
      minWidth: AdaptivePage.recommendWidth,
      pageBody: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _commonCell(context, const TimeTransformWidget()),
        ],
      )
    );
  }

  Widget _commonCell(BuildContext context, Widget child) {
    return Row(
      children: [
        Expanded(child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: child,
        ))
      ],
    );
  }

}

