import 'package:flutter/material.dart';
import 'components/home_page.dart';
import 'functions_classes/location_data.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    pingLocation();
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData(
          colorScheme: ColorScheme(
              background: Colors.black,
              error: Colors.red,
              onBackground: Color.fromARGB(255, 255, 255, 255),
              onError: Colors.black,
              onPrimary: Colors.black,
              onSecondary: Colors.black,
              onSurface: Color.fromARGB(255, 255, 255, 255),
              secondary: Colors.deepPurple,
              primary: Colors.deepPurple,
              surface: Colors.black12,
              brightness: Brightness.dark)),
      home: const HomePage(),
    );
  }
}
