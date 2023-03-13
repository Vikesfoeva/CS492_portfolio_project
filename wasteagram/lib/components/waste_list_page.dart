import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../styles/text_styles.dart';
import 'view_single_item.dart';

class WasteListPage extends StatefulWidget {
  final List<QueryDocumentSnapshot<Object?>>? wasteItems;
  const WasteListPage({super.key, required this.wasteItems});

  @override
  State<WasteListPage> createState() => _WasteListPageState();
}

class _WasteListPageState extends State<WasteListPage> {
  String convertDate(Timestamp value) {
    return DateFormat('EEEE, LLLL d yyyy').format(value.toDate());
  }

  Color tileBackground(bool isDark) {
    if (isDark) {
      return const Color.fromARGB(255, 255, 235, 227);
    }
    return Colors.white60;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listItems = [];
    List<QueryDocumentSnapshot<Object?>>? items = widget.wasteItems;
    bool isDark = false;
    if (items?.isNotEmpty ?? false) {
      for (var element in items!) {
        String count = element['count'].toString();
        listItems.add(Material(
            child: ListTile(
          tileColor: tileBackground(isDark),
          title: AppText(
              content: convertDate(element['creationDate']), size: 'medium'),
          subtitle: AppText(content: 'Count: $count', size: 'small'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WasteListItem(element: element)));
          },
        )));
        isDark = !isDark;
      }
    }
    return ListView(padding: const EdgeInsets.all(8), children: listItems);
  }
}
