
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionItem {
  String url;   // 收藏的链接
  String name;  // 收藏的名字
  String? iconUrl;

  CollectionItem(this.url, this.name);
}

class CollectionState {
  List<CollectionItem> items = List.empty(growable: true);
}

class CollectionEvent {

}

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc(CollectionState initialState) : super(initialState);

  factory CollectionBloc.test() {
    // FIXME: 测试数据
    var state = CollectionState();
    var item = CollectionItem("https://www.baidu.com", "百度一下，你就知道");
    for (int i = 0; i < 100; i++) {
      state.items.add(item);
    }
    return CollectionBloc(state);
  }
}