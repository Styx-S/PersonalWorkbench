part of foundations;

class PageSkeleton extends StatelessWidget {
  final String? horizontalTitle;
  final VoidCallback? horizontalTitleTap;
  final bool horizontalTitleHoverable;
  final List<PWBNavigationItem>? horizontalItems;
  final String? verticalTitle;
  final VoidCallback? verticalTitleTap;
  final bool verticalTitleHoverable;
  final Widget? verticalTitleTrailWidget;
  final List<PWBNavigationItem>? verticalItems;
  final WidgetBuilder bodyBuilder;
  const PageSkeleton({
    Key? key,
    this.horizontalTitle,
    this.horizontalTitleTap,
    this.horizontalTitleHoverable = false,
    this.horizontalItems,
    this.verticalTitle,
    this.verticalTitleTap,
    this.verticalTitleHoverable = false,
    this.verticalTitleTrailWidget,
    this.verticalItems,
    required this.bodyBuilder,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (horizontalTitle != null || horizontalItems != null)
          PWBHorizontalNavigationBar(
            items: horizontalItems,
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
                  items: verticalItems,
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
