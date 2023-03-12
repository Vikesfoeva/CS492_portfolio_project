import 'package:flutter/material.dart';

class WasteListPage extends StatefulWidget {
  const WasteListPage({super.key});

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
      children: const [
        Text("I found things!!"),
      ],
    ));
  }
}
