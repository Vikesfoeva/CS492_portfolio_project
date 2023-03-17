import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../functions/location_data.dart';
import 'package:firebase_storage/firebase_storage.dart';

class NewPostForm extends StatefulWidget {
  final File? image;
  const NewPostForm({super.key, required this.image});

  @override
  State<NewPostForm> createState() => _NewPostFormState();
}

class _NewPostFormState extends State<NewPostForm> {
  late num quantity = 0;
  final formKey = GlobalKey<FormState>();
  // https://stackoverflow.com/questions/42176092/dartlang-wait-more-than-one-future
  void handleUpload(BuildContext context, num quantity) async {
    if (!mounted) return;
    returnToMain(context);

    late String url;
    late LocationData? coordinates;
    await Future.wait([
      handleFileUpload().then((value) => url = value),
      pingLocation().then((value) => coordinates = value)
    ]);

    FirebaseFirestore.instance.collection('waste_items').add({
      'quantity': quantity,
      'creationDate': DateTime.now(),
      'latitude': coordinates?.latitude.toString(),
      'longitude': coordinates?.longitude.toString(),
      'imageUrl': url
    });
  }

  void returnToMain(context) {
    Navigator.of(context).pop();
  }

  Future<String> handleFileUpload() async {
    final storageRef = FirebaseStorage.instance.ref();
    String filePath = widget.image!.path;

    final imageReference = storageRef.child(filePath.split('/').last);
    await imageReference.putFile(File(filePath));

    return await imageReference.getDownloadURL();
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
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(widget.image!),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Quantity of Waste',
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  quantity = num.parse(value!);
                },
                validator: (value) {
                  try {
                    num.parse(value!);
                  } catch (event) {
                    return 'Please enter a number';
                  }
                  if (value.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    bool checkVal = formKey.currentState?.validate() ?? false;
                    if (checkVal) {
                      formKey.currentState?.save();
                      handleUpload(context, quantity);
                    }
                  },
                  child: const Icon(Icons.upload_file))
            ],
          ),
        ),
      ),
    );
  }
}
