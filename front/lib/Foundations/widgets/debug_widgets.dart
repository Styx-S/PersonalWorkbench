part of foundations;

class DebugConstraints extends StatelessWidget {
  final String? tag;
  final Widget child;

  const DebugConstraints({
    Key? key,
    this.tag,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      print("$tag $constraints");
      return child;
    });
  }
}