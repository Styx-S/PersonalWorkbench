
import 'package:flutter/cupertino.dart';
import 'package:workbench/app.dart';
import 'package:workbench/skeleton/pages/debug_page.dart';

class DebugGestureHandler {
  final BuildContext context;
  final int tapCount;
  final int tapInterval;  // ms
  DebugGestureHandler(this.context, {
    this.tapCount = 3,
    this.tapInterval = 500,
  });

  final List<int> tapTime = [];

  void onTap() {
    tapTime.add(DateTime.now().millisecondsSinceEpoch);
    if (tapTime.length < tapCount) {
      return;
    }

    int first = tapTime.first;
    int last = tapTime.last;
    tapTime.removeAt(0);
    if (last - first > tapInterval) {
      return;
    }

    PWBRouterDelegate.of(context).pushPage(context, DebugPageConfig.makeParam());
  }
}