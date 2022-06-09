part of foundations;

class PWBNavigationItem<T> {
  final T id;
  final String title;
  const PWBNavigationItem({required this.id, required this.title});
}

typedef OnNavChanged<T> = void Function<T>(T id);

class PWBNavigationBar<T> extends StatefulWidget {
  final OnNavChanged onNavChanged;
  final List<PWBNavigationItem> items;
  final String? logoText;
  final VoidCallback? logoTap;

  const PWBNavigationBar({
    Key? key,
    required this.onNavChanged,
    required this.items,
    this.logoText,
    this.logoTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PWBNavigationBarState();

}

class _PWBNavigationBarState<T> extends State<PWBNavigationBar> {

  T? currSelectItemId;

  @override
  Widget build(BuildContext context) {
    currSelectItemId ??= widget.items.first.id;

    return Container(
      color:  context.colors.navBackgroundColor,
      height: 52,
      child: Row(
        children: [
          if (widget.logoText != null)
            logoWidget(context, widget.logoText!),
          ...List.generate(widget.items.length, (index) {
            return Padding(
              padding: EdgeInsets.only(left: 2, right: 2),
              child: PWBNavigationItemWidget(
                item: widget.items[index],
                canSelect: index != currSelectItemId,
                onNavChanged: <T>(id){
                  widget.onNavChanged(id);
                },
                textColor: context.colors.navForegroundColor,
                hoverColor: getNavSpecColor.hoverColor,
                pressColor: getNavSpecColor.pressColor,
              ),
            );
          }),
        ],
      ),
    );
  }

  // 导航栏背景相当于是深色模式，所以这里获取的其他都要用深色对应的
  PWBSiteColor get getNavSpecColor => PWBSiteTheme.darkColor;

  Widget logoWidget(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: context.colors.navForegroundColor,
        ),
      ),
    );
  }
}


class PWBNavigationItemWidget extends StatelessWidget {
  final PWBNavigationItem item;
  final OnNavChanged? onNavChanged;
  final Color textColor;
  final Color? textHoverColor;
  final Color? hoverColor;
  final Color? pressColor;
  final bool canSelect;
  const PWBNavigationItemWidget({
    Key? key,
    required this.item,
    this.onNavChanged,
    required this.textColor,
    this.textHoverColor,
    this.hoverColor,
    this.pressColor,
    this.canSelect = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PWBResponder(
      clickable: canSelect,
      onTap: () => onNavChanged?.call(item.id),
      child: Builder(
        builder: (context){
          final rCtx = PWBResponderContext.of(context);
          return Container(
            decoration: BoxDecoration(
              color: rCtx.on(normal: null, hover: hoverColor, press: pressColor),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
              child: Text(
                item.title,
                style: TextStyle(
                  fontSize: 14,
                  color: rCtx.on(normal: textColor, hover: textHoverColor),
                ),
              ),
            ),
          );
        },
      )
    );
  }
  
}