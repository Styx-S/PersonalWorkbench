part of foundations;

class PWBButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final double? width;
  final double? height;

  const PWBButton({
    Key? key,
    this.onTap,
    this.title,
    this.width,
    this.height,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return PWBResponder.builder(
        onTap: onTap,
        builder: (context){
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: context.colors.buttonBlueBackgroundColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title!,
                  ),
                ],
              ),
            ),
          );
        });
  }

}