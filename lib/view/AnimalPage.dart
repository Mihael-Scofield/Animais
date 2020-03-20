import 'package:flutter/material.dart';

class AnimalPage extends StatefulWidget {
  String chosenAnimal;

  AnimalPage(this.chosenAnimal);
  
  @override
  State<StatefulWidget> createState() {
    return AnimalPageState(this.chosenAnimal);
  }
}

class AnimalPageState extends State<AnimalPage> {
  String chosenAnimal;
  
  AnimalPageState(this.chosenAnimal);
  String titlePage;

  String decideTitlePage() {
    if (chosenAnimal == 'cachorro') {
      return "Cachorros amam abanar o rabo";
    }
    else {
      return "Gatos amam morder os donos";
    }
  }

  @override
  void initState() {
    super.initState();
    titlePage = decideTitlePage();
  }  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlePage),
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