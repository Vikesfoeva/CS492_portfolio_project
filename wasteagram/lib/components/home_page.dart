import 'package:flutter/material.dart';
import 'empty_list.dart';
import 'waste_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, String> listItems = {};

  Widget checkListCount() {
    if (listItems.isEmpty) {
      return const EmptyList();
    }
    return const WasteListPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wasteagram'),
      ),
      body: checkListCount(),
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
            onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Placeholder()))
                },
            child: const Icon(Icons.add_a_photo));
      }),
    );
  }
}
