
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Foundations/foundations.dart';

typedef SiteConfigBuilder = Widget Function(BuildContext context, PWBSiteConfig config);
class GlobalSiteModel extends ChangeNotifier {
  static final provider = ChangeNotifierProvider((_) => GlobalSiteModel._());

  PWBSiteConfig siteConfig = const PWBSiteConfig(
    siteName: "PersonalWorkbench"
  );

  GlobalSiteModel._();

  void replaceSiteConfig(PWBSiteConfig config) {
    siteConfig = config;
    notifyListeners();
  }

  static Widget makeConfigBuilder(SiteConfigBuilder builder) {
    return Consumer(builder: (context, ref, _){
      return builder(context, ref.watch(provider).siteConfig);
    });
  }
}