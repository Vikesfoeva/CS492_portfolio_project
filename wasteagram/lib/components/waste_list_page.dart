import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../functions_classes/convert_date.dart';
import '../styles/text_styles.dart';
import 'view_single_item.dart';

class WasteListPage extends StatefulWidget {
  final List<QueryDocumentSnapshot<Object?>>? wasteItems;
  const WasteListPage({super.key, required this.wasteItems});

  @override
  State<WasteListPage> createState() => _WasteListPageState();
}

class _WasteListPageState extends State<WasteListPage> {
  Color tileBackground(bool isDark) {
    if (isDark) {
      return Color.fromARGB(255, 102, 102, 102);
    }
    return Color.fromARGB(104, 255, 255, 255);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listItems = [];
    List<QueryDocumentSnapshot<Object?>>? items = widget.wasteItems;
    bool isDark = false;
    if (items?.isNotEmpty ?? false) {
      for (var element in items!) {
        String quantity = element['quantity'].toString();
        listItems.add(Material(
            child: Semantics(
          enabled: true,
          button: true,
          onTapHint: 'Open the detailed view of this waste entry',
          label: 'Summary tile of a waste entry',
          child: ListTile(
            tileColor: tileBackground(isDark),
            title: AppText(
                content: convertDate(element['creationDate']), size: 'medium'),
            subtitle: AppText(content: 'Quantity: $quantity', size: 'small'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WasteListItem(element: element)));
            },
          ),
        )));
        isDark = !isDark;
      }
    }
    return ListView(padding: const EdgeInsets.all(8), children: listItems);
  }
}
