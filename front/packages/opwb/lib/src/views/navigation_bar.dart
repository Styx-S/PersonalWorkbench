import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationBar extends StatelessWidget {
  final List<NavigationItem> items; // 导航栏项目
  final List<NavigationItem> rightItems; // 右侧项目（仍然是从左往右排）
  const NavigationBar(this.items, this.rightItems, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF282F3D),
      child: Row(
        children: [
          for (final i in items) i.makeItemWidget(context),
          Expanded(
            child: Container(),
          ),
          for (final i in rightItems) i.makeItemWidget(context),
        ],
      ),
    );
  }

}

typedef OnItemPress = void Function(BuildContext context);
abstract class NavigationItem {
  NavigationItemType type;
  OnItemPress? onPress;

  NavigationItem(this.type, {this.onPress});

  Widget makeItemWidget(BuildContext context);

  factory NavigationItem.fromText(String title, {OnItemPress ?onPress}) {
    return TextNavigationItem(NavigationItemType.text, title, onPress: onPress);
  }
}

enum NavigationItemType {
  space, // 空行
  icon, // 单纯图标
  text, // 单纯文字
  iconText, // 图标+文字
}

class SpaceNavigationItem extends NavigationItem {
  SpaceNavigationItem(NavigationItemType type, {OnItemPress? onPress})
      : super(type, onPress: onPress);

  @override
  Widget makeItemWidget(BuildContext context) {
    // TODO: implement makeItemWidget
    throw UnimplementedError();
  }
}

class IconNavigationItem extends NavigationItem {
  IconNavigationItem(NavigationItemType type, {OnItemPress? onPress})
      : super(type, onPress: onPress);

  @override
  Widget makeItemWidget(BuildContext context) {
    // TODO: implement makeItemWidget
    throw UnimplementedError();
  }
}

class TextNavigationItem extends NavigationItem {
  String title;

  TextNavigationItem(NavigationItemType type, this.title,
      {OnItemPress? onPress})
      : super(type, onPress: onPress);

  @override
  Widget makeItemWidget(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(12),
      child: TextButton(
        onPressed: () => onPress!(context),
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFC1C6C8),
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class IconTextNavigationItem extends NavigationItem {
  IconTextNavigationItem(NavigationItemType type, {OnItemPress? onPress})
      : super(type, onPress: onPress);

  @override
  Widget makeItemWidget(BuildContext context) {
    // TODO: implement makeItemWidget
    throw UnimplementedError();
  }
}
