import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/styles/text_styles.dart';
import 'package:transparent_image/transparent_image.dart';

class WasteListItem extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> element;
  const WasteListItem({super.key, required this.element});
  void returnToMain(context) {
    Navigator.of(context).pop();
  }

  String convertDate(Timestamp value) {
    return DateFormat('EEEE, LLLL d yyyy').format(value.toDate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => returnToMain(context),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            AppText(
                content: convertDate(element['creationDate']), size: 'large'),
            const SizedBox(
              height: 40,
            ),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: element['imageUrl'],
              height: 300,
            ),
            const SizedBox(
              height: 40,
            ),
            AppText(
                content: '${element['quantity'].toString()} items',
                size: 'medium'),
            const SizedBox(
              height: 40,
            ),
            AppText(
                content:
                    'Location(${element['latitude']}, ${element['longitude']})',
                size: 'small'),
          ],
        ),
      ),
    );
  }
}
