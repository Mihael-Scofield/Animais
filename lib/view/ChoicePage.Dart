import 'package:flutter/material.dart';
import 'package:cat_app/view/AnimalPage.dart';
import 'package:cat_app/api/CatApi.dart';
import 'package:cat_app/api/DogApi.dart';
import 'package:cat_app/model/Cats.dart';
import 'package:cat_app/model/Dogs.dart';
import 'dart:convert';

class ChoicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChoicePageState();
  }
}

class ChoicePageState extends State<ChoicePage> {
  CatList catList;
  String catImage;
  String dogImage;

  void setDogImage() async {
    var dogImageUrl = await DogAPI().getDogBreeds();

    setState(() {
      dogImage = dogImageUrl;
    });
  }

  void setCatImage() async {
    var catJson = await CatAPI().getSingleCatBreed();
    print(catJson);

    var catMap = json.decode(catJson);
    print(catMap);
    setState(() {
      catList = CatList.fromJson(catMap);
      catImage = catList.breeds[0].url;
    });
  }

  @override
  void initState() {
    super.initState();
    setCatImage();
    setDogImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Escolha um animal para apreciar'),
        ),
        body: SafeArea(
            child: Center(             
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[

                  InkWell(
                    child: Container(
                      height: 170,
                      width: 170,
                      decoration: (BoxDecoration(
                        image: DecorationImage(
                          image: new NetworkImage(dogImage), fit: BoxFit.cover),
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
                          image: new NetworkImage(catImage), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12),
                      ))),
                    onTap: () {
                      navigateToAnimalPage('gato');
                    },
                  )
                ])
        )));
  }

  void navigateToAnimalPage(String chosenAnimal) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AnimalPage(chosenAnimal);
    }));
  }
}
