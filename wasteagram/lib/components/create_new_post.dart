
import 'dart:io';
import 'package:flutter/material.dart';

class NewPostForm extends StatefulWidget {
  final File? image;
  const NewPostForm({super.key, required this.image});

  @override
  State<NewPostForm> createState() => _NewPostFormState();
}

class _NewPostFormState extends State<NewPostForm> {
  void returnToMain() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => returnToMain(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(widget.image!),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {}, child: const Icon(Icons.upload_file))
          ],
        ),
      ),
    );
  }
}
