import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'empty_list.dart';
import 'waste_list_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  final FirebaseApp fireStore;
  const HomePage({super.key, required this.fireStore});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wasteagram'),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('waste_items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return WasteListPage(wasteItems: snapshot.data?.docs);
          }
          return const EmptyList();
        },
      ),
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
