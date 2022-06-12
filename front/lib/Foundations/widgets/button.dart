

import 'package:flutter/material.dart';
import 'package:workbench/Foundations/foundations.dart';

class PWBButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;

  const PWBButton({
    Key? key,
    this.onTap,
    this.title,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return PWBResponder(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: Colors.blue,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
            child: Text(
              title!,
            ),
          ),
    ));
  }

}