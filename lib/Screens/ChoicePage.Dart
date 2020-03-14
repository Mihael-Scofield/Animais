import 'package:flutter/material.dart';
import 'package:animais/Screens/AnimalPage.dart';

class ChoicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChoicePageState();
  }
}

class ChoicePageState extends State<ChoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animais são fofos!'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Cachorro'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnimalPage()),
            );
          },
        ),
      ),
    );
  }
}
