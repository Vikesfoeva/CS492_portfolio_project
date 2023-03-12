import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wasteagram/styles/text_styles.dart';
import '../firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WasteListItem extends StatefulWidget {
  final FirebaseApp fireStore;
  const WasteListItem({super.key, required this.fireStore});

  @override
  State<WasteListItem> createState() => _WasteListItemState();
}

class _WasteListItemState extends State<WasteListItem> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('waste_items').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          String postImage =
              snapshot.data?.docs[0]['imageUrl'].toString() ?? '';
          return AppText(content: postImage, size: 'large');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
