import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workbench/pages/collection_page/collection_bloc.dart';
import 'package:workbench/views/grid_layout.dart';

Widget getCollectionPage(BuildContext context) {
  return Container(
    color: Colors.white,
    child: const CollectionPage(),
  );
}

Widget getCollectionSideBar(BuildContext context) {
  return Container(
    color: const Color(0xFF1F222C),
    child: ListView(
      children: const [],
    ),
  );
}

class CollectionPage extends StatelessWidget {
  const CollectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectionBloc.test(),
      child: Container(
        child: collectionBody(context),
        padding: const EdgeInsets.fromLTRB(100, 75, 100, 0),
      ),
    );
  }

  Widget collectionBody(BuildContext context) {
    return BlocBuilder<CollectionBloc, CollectionState>(builder: (context, collectionState) {
      return GridView.builder(
          itemCount: collectionState.items.length,
          gridDelegate: const FixedSizeSliverGridDelegate(
            145,
            172,
            108,
            108,
          ),
          itemBuilder: (context, idx) {
            return collectionSingleWidget(context, collectionState.items.elementAt(idx));
          });
    });

  }


  Widget collectionSingleWidget(BuildContext context, CollectionItem item) {
    return Column(
      children: [
        Expanded(child: Container(
          child: SizedBox(
            width: 108,
            height: 108,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Image.network("${item.url}/favicon.ico"),
            ),
          ),
          alignment: Alignment.topCenter,
        )),
        Text(item.name, style: const TextStyle(
          fontSize: 14,
        ),),
      ],
    );
  }
}
