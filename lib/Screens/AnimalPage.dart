import 'package:flutter/material.dart';

class AnimalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimalPageState();
  }
}

class AnimalPageState extends State<AnimalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cachorros amam abanar o rabo!"),
      ),
    
    body: Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Retornar!'),
      )
    )
    );
  }
}