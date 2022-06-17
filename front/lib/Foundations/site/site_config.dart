part of foundations;

class PWBSiteConfig {
  final String siteName;

  static const String host = "";
  static const int port = 32359;

  const PWBSiteConfig({
    required this.siteName,
  });
}

class PWBSiteConfigWidget extends InheritedWidget {
  const PWBSiteConfigWidget({Key? key, required Widget child, required this.siteConfig}) : super(key: key, child: child);

  final PWBSiteConfig siteConfig;

  static PWBSiteConfigWidget of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<PWBSiteConfigWidget>();
    assert(widget != null);
    return widget!;
  }

  static PWBSiteConfig configOf(BuildContext context) {
    return of(context).siteConfig;
  }

  @override
  bool updateShouldNotify(PWBSiteConfigWidget oldWidget) {
    return oldWidget.siteConfig == siteConfig;
  }

}