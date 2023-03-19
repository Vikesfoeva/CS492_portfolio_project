import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/styles/text_styles.dart';
import 'package:transparent_image/transparent_image.dart';

import '../functions_classes/convert_date.dart';

class WasteListItem extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> element;
  const WasteListItem({super.key, required this.element});

  SizedBox spacer(double? height) {
    return SizedBox(height: height);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Semantics(
          enabled: true,
          button: true,
          onTapHint: 'Return to the list page of waste entrys',
          label: 'Back button',
          child: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            spacer(20),
            AppText(
                content: convertDate(element['creationDate']), size: 'large'),
            spacer(40),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: element['imageUrl'],
              height: 300,
            ),
            spacer(40),
            AppText(
                content: '${element['quantity'].toString()} items',
                size: 'medium'),
            spacer(40),
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
