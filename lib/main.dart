import 'package:flutter/material.dart';
import 'package:cat_app/view/ChoicePage.Dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Animais são fofos',
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: ChoicePage()
    );
  }
}