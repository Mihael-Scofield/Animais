import 'package:cat_app/utils/FetchData.dart';
import 'package:flutter/material.dart';
import 'package:cat_app/view/AnimalPage.dart';
import 'package:cat_app/model/Cats.dart';

class ChoicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChoicePageState();
  }
}

class ChoicePageState extends State<ChoicePage> {
  String catImage;
  String dogImage;

  @override
  void initState() {
    super.initState();
    setAnimalsImages();
  }

  void setAnimalsImages() async {
    FetchData fetchData = new FetchData();
   setState(() async {
      catImage = await fetchData.setCatImage();
      dogImage = await fetchData.setDogImage();      
    });
  }

  void navigateToAnimalPage(String chosenAnimal) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AnimalPage(chosenAnimal);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Escolha um animal para apreciar'),
        ),
        body: SafeArea(
            child: Center(             
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,

                  children: <Widget>[

                  InkWell(
                    child: Container(
                      height: 170,
                      width: 170,
                      decoration: (BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: dogImage != null 
                          ? new NetworkImage(dogImage)
                          : Container()
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ))),
                    onTap: () {
                      navigateToAnimalPage('cachorro');
                    },
                  ),

                  InkWell(
                      child: Container(                  
                      height: 170,
                      width: 170,
                      decoration: (BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: catImage != null 
                          ? new NetworkImage(catImage)
                          : Container()
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ))),
                    onTap: () {
                      navigateToAnimalPage('gato');
                    },
                  )
                ])
        )));
  }
}