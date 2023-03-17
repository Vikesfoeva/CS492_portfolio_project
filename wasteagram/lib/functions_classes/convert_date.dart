import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String convertDate(Timestamp value) {
  return DateFormat('EEEE, LLLL d yyyy').format(value.toDate());
}
