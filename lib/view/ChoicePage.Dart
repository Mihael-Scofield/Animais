import 'package:cat_app/utils/FetchData.dart';
import 'package:flutter/material.dart';
import 'package:cat_app/view/AnimalPage.dart';

class ChoicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChoicePageState();
  }
}

class ChoicePageState extends State<ChoicePage> {
  String catImage, dogImage, foxImage;

  @override
  void initState() {
    super.initState();
    setAnimalsImages();
  }

  // Seleciona as imagens dos animais
  void setAnimalsImages() async {
    FetchData fetchData = new FetchData();
    String newDogImageUrl = await fetchData.setDogImage();
    String newCatImageUrl = await fetchData.setCatImage();
    String newFoxImageUrl = await fetchData.setFoxImage();

    setState(() {
      dogImage = newDogImageUrl;
      catImage = newCatImageUrl;
      foxImage = newFoxImageUrl;
    });
  }

  // Faz a navegacao com o argumento do animal escolhido
  void navigateToAnimalPage(String chosenAnimal) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AnimalPage(chosenAnimal);
    }));
  }

  // Cria o InkWell, o card interativo com o animal passado
  InkWell createInkWell(String inkAnimal) {
    String animalImage, loadingAnimal;

    if (inkAnimal == 'cachorro') {
      animalImage = dogImage;
      loadingAnimal = 'assets/loadingDog.gif';
    } else {
      if (inkAnimal == 'gato') {
        animalImage = catImage;
        loadingAnimal = 'assets/loadingCat.gif';
      } else {
        animalImage = foxImage;
        loadingAnimal = 'assets/loadingFox.gif';
      }
    }

    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: animalImage != null
            ? FadeInImage(
                fadeInCurve: Curves.easeIn,
                fadeInDuration: Duration(milliseconds: 1500), // 1,5seg.
                image: NetworkImage(animalImage),
                placeholder: AssetImage(loadingAnimal),
                height: 170,
                width: 170,
                fit: BoxFit.cover)
            : Container(),
      ),
      onTap: () {
        navigateToAnimalPage(inkAnimal); // Navega de acordo com a chamada
      },
    );
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
                    alignment: WrapAlignment.spaceBetween,
                    spacing: 25.0,
                    runSpacing: 25.0,
                    children: <Widget>[
              createInkWell('cachorro'),
              createInkWell('gato'),
              createInkWell('raposa')
            ]))));
  }
}
