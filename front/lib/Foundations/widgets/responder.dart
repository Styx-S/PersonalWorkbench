part of foundations;

enum PWBResponderState {
  normal,
  hover,
  press,
}

extension StateConvient on PWBResponderState {
  T result<T>(T normal, T hover, T press) {
    switch(this) {
      case PWBResponderState.normal:
        return normal;
      case PWBResponderState.hover:
        return hover;
      case PWBResponderState.press:
        return press;
    }
  }
}

class PWBResponderContext extends InheritedWidget {
  final PWBResponderState state;
  const PWBResponderContext({
    required Widget child,
    required this.state,
  }) : super(child: child);

  @override
  bool updateShouldNotify(PWBResponderContext oldWidget) {
    return oldWidget.state != state;
  }

  static PWBResponderContext of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<PWBResponderContext>();
    assert(widget != null);
    return widget
        ?? PWBResponderContext(state: PWBResponderState.normal, child: Container(),);
  }

  T on<T>({required T normal, T? hover, T? press}) {
    return state.result(normal, hover ?? normal, press ?? normal);
  }

}


class PWBResponder extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget child;
  final bool clickable;   // 是否能点击
  final bool hoverable;   // 是否会传递hover态给子Child

  const PWBResponder({
    Key? key,
    this.onTap,
    required this.child,
    this.clickable = true,
    this.hoverable = true,
  }) : super(key: key);

  PWBResponder.builder({
    Key? key,
    this.onTap,
    required WidgetBuilder builder,
    this.clickable = true,
    this.hoverable = true,
  }) : child = Builder(builder: builder) , super(key: key);

  @override
  State<StatefulWidget> createState() => _PWBResponderState();
}

class _PWBResponderState extends State<PWBResponder> {

  ValueNotifier<PWBResponderState> currState = ValueNotifier<PWBResponderState>(PWBResponderState.normal);

  void onStateChange(PWBResponderState next) {
    if (next == currState) {
      return;
    }
    currState.value = next;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => widget.hoverable ? onStateChange(PWBResponderState.hover) : null,
      onExit: (_) => onStateChange(PWBResponderState.normal),
      cursor: widget.hoverable ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTapUp: (_) => onStateChange(PWBResponderState.normal),
        onTapDown: (_) => onStateChange(PWBResponderState.press),
        onTap: widget.clickable ? widget.onTap : null,
        child: ValueListenableBuilder(
          valueListenable: currState,
          builder: (context, value, _){
            return PWBResponderContext(
              state: currState.value,
              child: widget.child,
            );
          }),
        ),
    );
  }

}