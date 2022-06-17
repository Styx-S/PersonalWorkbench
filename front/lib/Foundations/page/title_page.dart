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