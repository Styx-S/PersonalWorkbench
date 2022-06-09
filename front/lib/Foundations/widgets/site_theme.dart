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
}

abstract class PWBSiteColor {
  const PWBSiteColor();

  Color get textL1TitleColor; // 一级文本

  Color get backgroundColor; // 背景色

  Color get navForegroundColor;  // 导航前景色
  Color get navBackgroundColor;  // 导航背景色

  Color get hoverColor;  // Hover态
  Color get pressColor;  // 按压态
}

class _PWBSiteColorImpl extends PWBSiteColor {
  final BuildContext context;
  const _PWBSiteColorImpl(this.context);

  @override
  Color get backgroundColor => CupertinoDynamicColor.resolve(
      CupertinoDynamicColor.withBrightness(
          color: PWBSiteTheme.lightColor.backgroundColor,
          darkColor: PWBSiteTheme.darkColor.backgroundColor,
      ), context);

  @override
  Color get hoverColor => CupertinoDynamicColor.resolve(
      CupertinoDynamicColor.withBrightness(
          color: PWBSiteTheme.lightColor.hoverColor,
          darkColor: PWBSiteTheme.darkColor.hoverColor,
      ), context);

  @override
  Color get navBackgroundColor => CupertinoDynamicColor.resolve(
      CupertinoDynamicColor.withBrightness(
          color: PWBSiteTheme.lightColor.navBackgroundColor,
          darkColor: PWBSiteTheme.darkColor.navBackgroundColor,
      ), context);

  @override
  Color get navForegroundColor => CupertinoDynamicColor.resolve(
      CupertinoDynamicColor.withBrightness(
          color: PWBSiteTheme.lightColor.navForegroundColor,
          darkColor: PWBSiteTheme.darkColor.navForegroundColor,
      ), context);

  @override
  Color get pressColor => CupertinoDynamicColor.resolve(
      CupertinoDynamicColor.withBrightness(
          color: PWBSiteTheme.lightColor.pressColor,
          darkColor: PWBSiteTheme.darkColor.pressColor,
      ), context);

  @override
  Color get textL1TitleColor => CupertinoDynamicColor.resolve(
      CupertinoDynamicColor.withBrightness(
          color: PWBSiteTheme.lightColor.textL1TitleColor,
          darkColor: PWBSiteTheme.darkColor.textL1TitleColor,
      ), context);

}

class PWBSiteColorLight extends PWBSiteColor {
  const PWBSiteColorLight();
  @override
  Color get backgroundColor => Color(0xFFFFFFFF);
  @override
  Color get hoverColor => Color(0x0D060F1A);
  @override
  Color get navBackgroundColor => Color(0xFF10141A);  // 导航颜色不变
  @override
  Color get navForegroundColor => Color(0xFFFFFFFF);  // 导航颜色不变
  @override
  Color get pressColor => Color(0x1A060F1A);
  @override
  Color get textL1TitleColor => Color(0xFF000000);

}

class PWBSiteColorDark extends PWBSiteColor {
  const PWBSiteColorDark();
  @override
  Color get backgroundColor => Color(0xFF1E1E1E);
  @override
  Color get hoverColor => Color(0x3D5D6166);
  @override
  Color get navBackgroundColor => Color(0xFF10141A);  // 导航颜色不变
  @override
  Color get navForegroundColor => Color(0xFFFFFFFF);  // 导航颜色不变
  @override
  Color get pressColor => Color(0x476F747A);
  @override
  Color get textL1TitleColor => Color(0xFFE1E1E1);
}