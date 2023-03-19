import 'package:test/test.dart';
import '../functions_classes/waste_entry_class.dart';

void main() {
  test('Test empty waste model', () {
    WasteEntry wasteModel = WasteEntry();
    expect({
      'quantity': null,
      'creationDate': null,
      'latitude': null,
      'longitude': null,
      'imageUrl': null
    }, equals(wasteModel.toMap()));
  });
  test('Test the model creates a list', () {
    Map<String, dynamic> testEntry = buildTest();
    WasteEntry wasteModel = WasteEntry(
        quantity: testEntry['quantity'],
        latitude: testEntry['latitude'],
        longitude: testEntry['longitude'],
        imageUrl: testEntry['imageUrl'],
        creationDate: testEntry['creationDate']);

    expect(wasteModel.toMap(), equals(testEntry));
    expect(wasteModel.imageUrl, equals(testEntry['imageUrl']));
    expect(wasteModel.quantity, equals(testEntry['quantity']));
    expect(wasteModel.latitude, equals(testEntry['latitude']));
    expect(wasteModel.longitude, equals(testEntry['longitude']));
    expect(wasteModel.creationDate, equals(testEntry['creationDate']));
  });

  test('Test ability to change a waste item', () {
    Map<String, dynamic> testEntry = buildTest();
    WasteEntry wasteModel = WasteEntry(
        quantity: testEntry['quantity'],
        latitude: testEntry['latitude'],
        longitude: testEntry['longitude'],
        imageUrl: testEntry['imageUrl'],
        creationDate: testEntry['creationDate']);
    wasteModel.quantity = 99;
    expect(wasteModel.quantity, 99);
  });
}

Map<String, dynamic> buildTest() {
  return {
    'quantity': 1,
    'creationDate': DateTime.now(),
    'latitude': 'abc',
    'longitude': 'def',
    'imageUrl': 'google.com'
  };
}
