import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../functions_classes/handle_uploads.dart';
import '../functions_classes/waste_entry_class.dart';

class NewPostForm extends StatefulWidget {
  final File? image;
  const NewPostForm({super.key, required this.image});

  @override
  State<NewPostForm> createState() => _NewPostFormState();
}

class _NewPostFormState extends State<NewPostForm> {
  final wasteEntry = WasteEntry();
  final formKey = GlobalKey<FormState>();

  void handleUpload(BuildContext context, WasteEntry wasteEntry) async {
    if (!mounted) return;
    Navigator.of(context).pop();

    WasteEntry submission = await finishEntryBuild(wasteEntry, widget.image);

    FirebaseFirestore.instance
        .collection('waste_items')
        .add(submission.toMap());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(
                widget.image!,
                height: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              Semantics(
                enabled: true,
                textField: true,
                focusable: true,
                onTapHint: 'Focus on field to enter a number',
                label: 'Form field to enter a number for amount of waste',
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Quantity of Waste',
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    wasteEntry.quantity = num.parse(value!);
                  },
                  validator: (value) {
                    String errorMsg = 'Please enter a number';
                    try {
                      num.parse(value!);
                      if (value.isEmpty) return errorMsg;
                    } catch (event) {
                      return errorMsg;
                    }
                    return null;
                  },
                ),
              ),
              Semantics(
                enabled: true,
                button: true,
                onTapHint: 'Upload the entry',
                label: 'Upload the entry',
                child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState?.validate() ?? false) {
                        formKey.currentState?.save();
                        handleUpload(context, wasteEntry);
                      }
                    },
                    child: const Icon(Icons.upload_file)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
