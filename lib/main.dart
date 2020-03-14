import 'package:flutter/material.dart';
import 'package:animais/Screens/ChoicePage.Dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Animais são fofos',
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: ChoicePage()
    );
  }
}