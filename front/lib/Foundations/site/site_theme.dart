part of foundations;

class PWBSiteTheme {
  static const PWBSiteColor lightColor = const PWBSiteColorLight();
  static const PWBSiteColor darkColor = const PWBSiteColorDark();
}

extension PWBSiteThemeContextExt on BuildContext {


  PWBSiteColor get colors {
    return _PWBSiteColorImpl(this);
  }
  PWBSiteColor get lightColor => PWBSiteTheme.lightColor;
  PWBSiteColor get darkColor => PWBSiteTheme.darkColor;
  PWBSiteColor get navColor => PWBSiteTheme.darkColor; // 导航栏背景相当于是深色模式，所以这里获取的其他都要用深色对应的
}

abstract class PWBSiteColor {
  const PWBSiteColor();

  Color get textL1TitleColor; // 一级文本

  Color get backgroundColor; // 背景色
  Color get hoverColor;  // Hover态
  Color get pressColor;  // 按压态

  Color get navForegroundColor;  // 导航前景色
  Color get navBackgroundColor;  // 导航背景色


  Color get buttonBlueBackgroundColor;  // 蓝色按钮背景色
  Color get buttonBlueForegroundColor;  // 蓝色按钮前景色
  Color get buttonBlueHoverColor;
  Color get buttonBluePressColor;
}

class _PWBSiteColorImpl extends PWBSiteColor {
  final BuildContext context;
  const _PWBSiteColorImpl(this.context);

  Color _resolve(Color Function(PWBSiteColor color) visitor) {
    return CupertinoDynamicColor.resolve(
        CupertinoDynamicColor.withBrightness(
          color: visitor(PWBSiteTheme.lightColor),
          darkColor: visitor(PWBSiteTheme.darkColor),
        ), context);
  }

  @override
  Color get backgroundColor => _resolve((p0) => p0.backgroundColor);
  @override
  Color get hoverColor => _resolve((p0) => p0.hoverColor);
  @override
  Color get navBackgroundColor => _resolve((p0) => p0.navBackgroundColor);
  @override
  Color get navForegroundColor => _resolve((p0) => p0.navForegroundColor);
  @override
  Color get pressColor => _resolve((p0) => p0.pressColor);
  @override
  Color get textL1TitleColor => _resolve((p0) => p0.textL1TitleColor);
  @override
  Color get buttonBlueBackgroundColor => _resolve((p0) => p0.buttonBlueBackgroundColor);
  @override
  Color get buttonBlueForegroundColor => _resolve((p0) => p0.buttonBlueForegroundColor);
  @override
  Color get buttonBlueHoverColor => _resolve((p0) => p0.buttonBlueHoverColor);
  @override
  Color get buttonBluePressColor => _resolve((p0) => p0.buttonBluePressColor);

}

class PWBSiteColorLight extends PWBSiteColor {
  const PWBSiteColorLight();
  @override
  Color get backgroundColor => const Color(0xFFFFFFFF);
  @override
  Color get hoverColor => const Color(0x0D060F1A);
  @override
  Color get navBackgroundColor => const Color(0xFF10141A);  // 导航颜色不变
  @override
  Color get navForegroundColor => const Color(0xFFFFFFFF);  // 导航颜色不变
  @override
  Color get pressColor => const Color(0x1A060F1A);
  @override
  Color get textL1TitleColor => const Color(0xFF000000);
  @override
  Color get buttonBlueBackgroundColor => const Color(0xFF267EF0);
  @override
  Color get buttonBlueForegroundColor => const Color(0xFFFFFFFF);
  @override
  Color get buttonBlueHoverColor => const Color(0xFF4B95F3);
  @override
  Color get buttonBluePressColor => const Color(0xFF1B5BB0);

}

class PWBSiteColorDark extends PWBSiteColor {
  const PWBSiteColorDark();
  @override
  Color get backgroundColor => const Color(0xFF1E1E1E);
  @override
  Color get hoverColor => const Color(0x3D5D6166);
  @override
  Color get navBackgroundColor => const Color(0xFF10141A);  // 导航颜色不变
  @override
  Color get navForegroundColor => const Color(0xFFFFFFFF);  // 导航颜色不变
  @override
  Color get pressColor => const Color(0x476F747A);
  @override
  Color get textL1TitleColor => const Color(0xFFE1E1E1);
  @override
  Color get buttonBlueBackgroundColor => const Color(0xFF338CFF);
  @override
  Color get buttonBlueForegroundColor => const Color(0xFFFFFFFF);
  @override
  Color get buttonBlueHoverColor => const Color(0xFF2E7FE9);
  @override
  Color get buttonBluePressColor => const Color(0xFF6FAFFF);
}