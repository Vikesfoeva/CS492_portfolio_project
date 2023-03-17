import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'waste_entry_class.dart';
import 'location_data.dart';

Future<WasteEntry> finishEntryBuild(WasteEntry wasteEntry, File? image) async {
  wasteEntry.creationDate = DateTime.now();

  await Future.wait([
    handleFileUpload(image).then((value) {
      wasteEntry.imageUrl = value;
    }),
    pingLocation().then((value) {
      wasteEntry.latitude = value?.latitude.toString();
      wasteEntry.longitude = value?.longitude.toString();
    })
  ]);

  return wasteEntry;
}

Future<String> handleFileUpload(File? image) async {
  final storageRef = FirebaseStorage.instance.ref();
  String filePath = image!.path;

  final imageReference = storageRef.child(filePath.split('/').last);
  await imageReference.putFile(File(filePath));

  return await imageReference.getDownloadURL();
}
