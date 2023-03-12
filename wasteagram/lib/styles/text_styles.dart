import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String content;
  final String size;

  const AppText({super.key, required this.content, required this.size});

  static const Map<String, int> sizeMap = {
    'extraLarge': 35,
    'large': 25,
    'medium': 20,
    'small': 18,
    'extraSmall': 14
  };

  @override
  Widget build(BuildContext context) {
    return Text(content,
        style: GoogleFonts.openSans(
            textStyle: TextStyle(fontSize: sizeMap[size]?.toDouble())));
  }
}
