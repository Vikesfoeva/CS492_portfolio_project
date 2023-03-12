import 'package:flutter/material.dart';
import '../styles/text_styles.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(),
        ),
        AppText(
          content: "Nothing found",
          size: 'large',
        ),
      ],
    ));
  }
}
