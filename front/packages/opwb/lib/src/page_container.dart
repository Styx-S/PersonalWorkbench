import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:opwb/src/pages/collection_page/collection_page.dart';

import 'global/router_bloc.dart';

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
  final Widget? navigationBar;
  final Widget? sideBar;
  final Widget app;

  const PageContainer(this.navigationBar, this.sideBar, this.app, {Key? key})
      : super(key: key);

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
        if (widget.navigationBar != null)
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
              Expanded(
                child: widget.app,
              )
            ],
          ),
        ),
      ],
    );
  }
}

// router Config
typedef PageBuilder = Widget Function(BuildContext context);
typedef SideBarBuilder = Widget? Function(BuildContext context);

class PageHelper {
  static Map<String, SideBarBuilder> sideBars = {
    // RouterDefineStr.kMainPage: (context) => getCollectionSideBar(context),
  };

  static Map<String, PageBuilder> pages = {
    RouterDefineStr.kMainPage: (context) => getCollectionPage(context),
  };

  static SideBarBuilder? getSideBar(String routerStr) {
    return sideBars[routerStr];
  }

  static PageBuilder getPage(String routerStr) {
    var pb = pages[routerStr];
    pb = pages[RouterDefineStr.kMainPage];
    // 如果不存在则跳主页，主页一定存在
    return pb!;
  }
}
