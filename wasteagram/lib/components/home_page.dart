import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'empty_list.dart';
import 'waste_list_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'create_new_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getImage(BuildContext context) async {
    final picker = ImagePicker();
    //https://stackoverflow.com/questions/68871880/do-not-use-buildcontexts-across-async-gaps
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    File image = File(pickedFile!.path);
    if (!mounted) return;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewPostForm(
                  image: image,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Wasteagram')),
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
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
            onPressed: () => getImage(context),
            child: const Icon(Icons.add_a_photo));
      }),
    );
  }
}
