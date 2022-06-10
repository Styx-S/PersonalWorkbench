part of foundations;

class PWBNavigationItem<T> {
  final T id;     // onNavChanged 回调
  final String title;
  final VoidCallback? onSelect;
  const PWBNavigationItem({required this.id, required this.title, this.onSelect});

}

typedef OnNavChangedT1<T> = void Function(T id);
typedef OnNavChangedT2 = void Function<T>(T id);



class PWBHorizontalNavigationBar extends StatefulWidget {
  final OnNavChangedT2? onNavChanged;
  final List<PWBNavigationItem>? items;
  final String? logoText;
  final VoidCallback? logoTap;
  final bool logoHoverable;

  const PWBHorizontalNavigationBar({
    Key? key,
    this.onNavChanged,
    required this.items,
    this.logoText,
    this.logoTap,
    this.logoHoverable = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PWBHorizontalNavigationBarState();

}

class _PWBHorizontalNavigationBarState<T> extends State<PWBHorizontalNavigationBar> {

  T? currSelectItemId;

  @override
  Widget build(BuildContext context) {
    currSelectItemId ??= widget.items?.first.id;

    return Container(
      color:  context.colors.navBackgroundColor,
      height: 52,
      child: Row(
        children: [
          if (widget.logoText != null)
            PWBNavigationLogoWidget(
              text: widget.logoText!,
              onTap: widget.logoTap,
              margin: const EdgeInsets.only(left: 10, right: 10),
              hoverable: widget.logoHoverable,
            ),
          if (widget.items != null)
          ...List.generate(widget.items!.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 2, right: 2),
              child: PWBNavigationItemWidget(
                item: widget.items![index],
                canSelect: index != currSelectItemId,
                onNavChanged: (item){
                  widget.onNavChanged?.call(item.id);
                  item.onSelect?.call();
                },
                textColor: context.colors.navForegroundColor,
                hoverColor: context.navColor.hoverColor,
                pressColor: context.navColor.pressColor,
              ),
            );
          }),
        ],
      ),
    );
  }
}


class PWBNavigationItemWidget extends StatelessWidget {
  final PWBNavigationItem item;
  final OnNavChangedT1<PWBNavigationItem>? onNavChanged;
  final Color textColor;
  final Color? textHoverColor;
  final Color? hoverColor;
  final Color? pressColor;
  final bool canSelect;
  final EdgeInsets? margin;
  final double fontSize;
  const PWBNavigationItemWidget({
    Key? key,
    required this.item,
    this.onNavChanged,
    required this.textColor,
    this.textHoverColor,
    this.hoverColor,
    this.pressColor,
    this.canSelect = true,
    this.margin = const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PWBResponder(
      clickable: canSelect,
      onTap: () => onNavChanged?.call(item),
      child: Builder(
        builder: (context){
          final rCtx = PWBResponderContext.of(context);
          return Container(
            decoration: BoxDecoration(
              color: rCtx.on(normal: null, hover: hoverColor, press: pressColor),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Padding(
              padding: margin ?? EdgeInsets.zero,
              child: Text(
                item.title,
                style: TextStyle(
                  fontSize: fontSize,
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

class PWBNavigationLogoWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final bool hoverable;
  const PWBNavigationLogoWidget({
    Key? key,
    required this.text,
    this.onTap,
    this.margin,
    this.hoverable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: PWBResponder(
        hoverable: hoverable,
        onTap: onTap,
        child: Builder(
          builder: (context) {
            return Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: PWBResponderContext.of(context).on(normal: context.colors.navForegroundColor, hover: PWBSiteTheme.darkColor.hoverColor) ,
              ),
            );
          }
        ),
      ),
    );
  }

}

class PWBVerticalNavigationBar extends StatefulWidget {
  final OnNavChangedT2 ? onNavChanged;
  final List<PWBNavigationItem>? items;
  final String? logoText;
  final VoidCallback? logoTap;
  final bool logoHoverable;
  final Widget? trailWidget;

  const PWBVerticalNavigationBar({
    Key? key,
    this.onNavChanged,
    required this.items,
    this.logoText,
    this.logoTap,
    this.logoHoverable = false,
    this.trailWidget,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _PWBVerticalNavigationBarState();
  
}

class _PWBVerticalNavigationBarState<T> extends State<PWBVerticalNavigationBar> {

  T? currSelectItemId;

  @override
  Widget build(BuildContext context) {
    bool hasTrail = widget.trailWidget != null;

    return Container(
      color: context.colors.navBackgroundColor,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.logoText != null)
            Row(
              children: [
                PWBNavigationLogoWidget(
                  text: widget.logoText!,
                  onTap: widget.logoTap,
                  margin: hasTrail
                      ? const EdgeInsets.only(left: 20, right: 8, top: 20, bottom: 20)
                      : const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  hoverable: widget.logoHoverable,
                ),
                if (hasTrail)
                  widget.trailWidget!,
              ],
            ),
          if (widget.items != null)
          ...List.generate(widget.items!.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              child: Row(
                children: [
                  Expanded(child: PWBNavigationItemWidget(
                    item: widget.items![index],
                    canSelect: index != currSelectItemId,
                    onNavChanged: (item){
                      widget.onNavChanged?.call(item.id);
                      item.onSelect?.call();
                    },
                    textColor: context.colors.navForegroundColor,
                    hoverColor: context.navColor.hoverColor,
                    pressColor: context.navColor.pressColor,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
                    fontSize: 16,
                  ),),
                ],
              )
            );
          }),
        ],
      ),
    );
  }
  
}