
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/////////////////// NavigationBar ///////////////////
////////
////////
////////
////////
//SideBar             ContentWidget
////////
////////
////////
////////

class PageContainer extends StatefulWidget {
  final Widget  navigationBar;
  final Widget? sideBar;
  final Widget  app;

  const PageContainer(this.navigationBar, this.sideBar, this.app, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PageContainerState();
  }
}

class _PageContainerState extends State<PageContainer> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: widget.navigationBar,
        ),
        Expanded(
          child: Row(
            children: [
              if (widget.sideBar != null)
                SizedBox(
                  width: 200,
                  child: widget.sideBar,
                ),
              Expanded(child: widget.app,)
            ],
          ),
        ),
      ],
    );
  }

}