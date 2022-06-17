part of foundations;

class PageSkeleton extends StatelessWidget {
  final String? horizontalTitle;
  final VoidCallback? horizontalTitleTap;
  final bool horizontalTitleHoverable;
  final bool horizontalSelectInNavBar;
  final int? horizontalSelectIdx;
  final List<PWBNavigationItem>? horizontalItems;
  final OnNavChangedT2? horizontalNavChanged;
  final String? verticalTitle;
  final VoidCallback? verticalTitleTap;
  final bool verticalTitleHoverable;
  final Widget? verticalTitleTrailWidget;
  final bool verticalSelectInNavBar;
  final int? verticalSelectIdx;
  final List<PWBNavigationItem>? verticalItems;
  final OnNavChangedT2? verticalNavChanged;
  final WidgetBuilder bodyBuilder;
  const PageSkeleton({
    Key? key,
    this.horizontalTitle,
    this.horizontalTitleTap,
    this.horizontalTitleHoverable = false,
    this.horizontalSelectInNavBar = true,
    this.horizontalSelectIdx,
    this.horizontalItems,
    this.horizontalNavChanged,
    this.verticalTitle,
    this.verticalTitleTap,
    this.verticalTitleHoverable = false,
    this.verticalSelectInNavBar = true,
    this.verticalTitleTrailWidget,
    this.verticalSelectIdx,
    this.verticalItems,
    this.verticalNavChanged,
    required this.bodyBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (horizontalTitle != null || horizontalItems != null)
          PWBHorizontalNavigationBar(
            defaultSelectItemId: horizontalSelectIdx != null ? horizontalItems![horizontalSelectIdx!].id : null,
            selectInNavBar: horizontalSelectInNavBar,
            items: horizontalItems,
            onNavChanged: horizontalNavChanged,
            logoText: horizontalTitle,
            logoTap: horizontalTitleTap,
            logoHoverable: horizontalTitleHoverable,
          ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (verticalTitle != null || verticalItems != null)
                PWBVerticalNavigationBar(
                  defaultSelectItemId: verticalSelectIdx != null ? verticalItems![verticalSelectIdx!].id : null,
                  selectInNavBar: verticalSelectInNavBar,
                  items: verticalItems,
                  onNavChanged: verticalNavChanged,
                  logoText: verticalTitle,
                  logoTap: verticalTitleTap,
                  logoHoverable: verticalTitleHoverable,
                  trailWidget: verticalTitleTrailWidget,
                ),
              Expanded(child: bodyBuilder(context),),
            ],
          ),
        )
      ],
    );
  }

}


// 多个页面有同样导航栏的实现方式
// 1. 通过PageSkeletonItemHelper 创建一份导航栏，管理切换页面(debug_page)，页面只实现内部区域
// 2. 每个页面是完整的结构，通过model共享导航栏内容（这样允许某个页面 试用不同的导航栏）

class NavItem {

  final String pageName;
  final String? id;
  final PWBRouteParam Function() makePageNavigatorParam;
  final VoidCallback? tapHandle;
  NavItem(this.pageName, this.makePageNavigatorParam, {this.id, this.tapHandle});
}

typedef ModelContextFunc = void Function(NavModel model, BuildContext context);
class NavModel {
  final bool convertFirst2Logo;
  List<NavItem> pages;
  int selectPageIndex;
  ModelContextFunc? setContextIfNeed;
  Map<String, dynamic> args = {};
  NavModel({required this.pages, this.selectPageIndex = 0, this.convertFirst2Logo = false});

  PWBRouteParam? selectPage(BuildContext context, int pageIndex) {
    if (pageIndex >= pages.length) {
      return null;
    }
    selectPageIndex = pageIndex;
    return pages[pageIndex].makePageNavigatorParam();
  }

  void selectPageWithId(String id) {
    int? updateIdx;
    for (int idx = 0; idx < pages.length; idx ++) {
      if (pages[idx].id == id) {
        updateIdx = idx;
        break;
      }
    }
    if (updateIdx != null) {
      selectPageIndex = updateIdx;
    }
  }

  Widget makeNavPage(WidgetBuilder bodyBuilder) {

    assert(!convertFirst2Logo || pages.isNotEmpty);
    bool localConvertFirst2Logo = convertFirst2Logo;
    if (localConvertFirst2Logo && pages.isEmpty) {
      localConvertFirst2Logo = false;
    }

    List<NavItem> items = [...pages];
    if (localConvertFirst2Logo) {
      items.removeAt(0);
    }

    int? navItemsSelectIdx = selectPageIndex;
    if (localConvertFirst2Logo) {
      if (selectPageIndex == 0) {
        navItemsSelectIdx = null;
      } else {
        navItemsSelectIdx -= 1;
      }
    }

    return Builder(builder: (context){
      var navIdx = -1;
      final navs = items.map((e) {
        navIdx += 1;
        return PWBNavigationItem<int>(id: navIdx + 1, title: e.pageName, onSelect: (){
          selectPageIndex = navIdx + 1;
          e.tapHandle?.call(); // 这个位置只有未选中时才能点击
          PWBRouterDelegate.of(context).pushPage(context, e.makePageNavigatorParam(), replace: true);
        });
      }).toList();

      return PageSkeleton(
        horizontalTitle: localConvertFirst2Logo ? PWBSiteConfigWidget.configOf(context).siteName : null,
        horizontalTitleHoverable: localConvertFirst2Logo && selectPageIndex != 0 ? true : false,
        horizontalTitleTap: localConvertFirst2Logo ? (){
          pages.first.tapHandle?.call();
          if (selectPageIndex != 0) {
            selectPageIndex = 0;
            PWBRouterDelegate.of(context).pushPage(
                context, pages.first.makePageNavigatorParam(), replace: true);
          }
        } : null,
        horizontalItems: navs,
        horizontalSelectIdx: navItemsSelectIdx,
        horizontalSelectInNavBar: navItemsSelectIdx != null,
        bodyBuilder: bodyBuilder,);
    });
  }
}

class PageSkeletonItemHelper {
  final List<PWBNavigationItem> _items = [];
  int idx = 0;
  Widget? currentSelectWidget;
  List<PWBNavigationItem> get items {
    // 每次取的时候认为是设置到PageSkeleton上了，这个时候需要body不为空
    assert(currentSelectWidget != null);
    return _items;
  }

  VoidCallback? notify;

  void addDefaultItem(PWBNavigationItem item) {
    _items.add(item);
  }

  void addBodyChangeItem(String title, Widget body, {bool isDefault = false}) {
    if (isDefault){
      currentSelectWidget = body;
    }
    currentSelectWidget ??= body;
    final item = PWBNavigationItem<int>(
        id: idx++,
        title: title,
        onSelect: (){
          currentSelectWidget = body;
          notify?.call();
        }
    );
    _items.add(item);
  }

  Widget makeBody(BuildContext context) {
    return currentSelectWidget ?? Container();
  }
}
