import 'package:flutter/material.dart';
import 'package:weather_app/Themes/theme.dart';
import 'package:weather_app/User%20Interface/home.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const HomePage(),
    );
  }
}
