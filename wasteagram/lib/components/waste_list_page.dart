import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../styles/text_styles.dart';

class WasteListPage extends StatefulWidget {
  final List<QueryDocumentSnapshot<Object?>>? wasteItems;
  const WasteListPage({super.key, required this.wasteItems});

  @override
  State<WasteListPage> createState() => _WasteListPageState();
}

class _WasteListPageState extends State<WasteListPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> listItems = [];
    List<QueryDocumentSnapshot<Object?>>? items = widget.wasteItems;
    if (items?.isNotEmpty ?? false) {
      for (var ele in items!) {
        listItems.add(Material(
            child: ListTile(
          title: AppText(content: ele['imageUrl'].toString(), size: 'medium'),
          subtitle:
              AppText(content: ele['creationDate'].toString(), size: 'small'),
          onTap: () {},
        )));
      }
    }
    return ListView(padding: const EdgeInsets.all(8), children: listItems);
  }
}
