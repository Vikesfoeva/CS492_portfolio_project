import 'package:flutter/material.dart';
import 'components/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

class App extends StatelessWidget {
  final FirebaseApp fireStore;
  const App({super.key, required this.fireStore});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(fireStore: fireStore),
    );
  }
}
