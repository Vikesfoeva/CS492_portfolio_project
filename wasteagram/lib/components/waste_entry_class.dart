class WasteEntry {
  late num? quantity;
  late DateTime? creationDate;
  late String? latitude;
  late String? longitude;
  late String? imageUrl;

  WasteEntry(
      {this.quantity,
      this.creationDate,
      this.latitude,
      this.longitude,
      this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'creationDate': creationDate,
      'latitude': latitude,
      'longitude': longitude,
      'imageUrl': imageUrl
    };
  }
}
