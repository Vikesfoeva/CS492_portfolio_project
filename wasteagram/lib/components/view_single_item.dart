import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WasteListItem extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> element;
  const WasteListItem({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
