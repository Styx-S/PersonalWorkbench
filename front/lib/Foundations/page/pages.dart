part of foundations;

class TitlePage extends StatelessWidget {
  final String title;
  final Widget pageBody;

  const TitlePage({
    Key? key,
    required this.title,
    required this.pageBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12,),
          child: Text(
            title.overflowStr,
            style: TextStyle(
              color: context.colors.textL1TitleColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(child: pageBody),
      ],
    );
  }
}


class AdaptivePage extends StatelessWidget {
  const AdaptivePage({
    Key? key,
    this.minWidth,
    this.minHeight,
    required this.pageBody,
  }) : super(key: key);

  static const double recommendWidth = 768;

  final double? minWidth;
  final double? minHeight;
  final Widget pageBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var wrapPage = pageBody;
      if (minWidth != null && constraints.maxWidth < minWidth!) {
        wrapPage = SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: minWidth,
            child: wrapPage,
          ),
        );
      }
      if (minHeight != null && constraints.maxHeight < minHeight!) {
        wrapPage = SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: minHeight,
            child: wrapPage,
          ),
        );
      }
      return wrapPage;
    });
  }

}