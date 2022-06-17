part of foundations;

class MinSizedPage extends StatelessWidget {
  final double? minWidth;
  final double? minHeight;
  final Widget child;

  const MinSizedPage({
    Key? key,
    this.minWidth,
    this.minHeight,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var wrapWidget = child;
      if (minHeight != null && constraints.maxHeight < minHeight!) {
        wrapWidget = SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: minHeight,
            child: wrapWidget,
          ),
        );
      }
      if (minWidth != null && constraints.maxWidth < minWidth!) {
        wrapWidget = SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: minWidth,
            child: wrapWidget,
          ),
        );
      }
      return wrapWidget;
    });
  }

}