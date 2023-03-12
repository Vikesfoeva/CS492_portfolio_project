import 'package:flutter/material.dart';
import '../styles/text_styles.dart';
import 'waste_list_item.dart';
import 'package:firebase_core/firebase_core.dart';

class WasteListPage extends StatefulWidget {
  final FirebaseApp fireStore;
  const WasteListPage({super.key, required this.fireStore});

  @override
  State<WasteListPage> createState() => _WasteListPageState();
}

class _WasteListPageState extends State<WasteListPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AppText(
          content: "I found things!!",
          size: 'large',
        ),
        WasteListItem(fireStore: widget.fireStore)
      ],
    ));
  }
}
