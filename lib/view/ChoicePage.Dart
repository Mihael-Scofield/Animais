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
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 25.0,

                  children: <Widget>[

                  InkWell(
                    child: ClipRRect (
                      borderRadius: BorderRadius.circular(25),
                      child: dogImage != null
                          ? FadeInImage(
                          fadeInCurve: Curves.easeIn,
                          fadeInDuration: Duration(milliseconds: 1500), // 1,5seg.
                          image: NetworkImage(dogImage),
                          placeholder: AssetImage('assets/loadingDog.gif'),
                          height: 170,
                          width: 170,                          
                          fit: BoxFit.cover
                          )
                          : Container(),
                        ),                        
                        onTap: () {
                          navigateToAnimalPage('cachorro');
                        },
                      ),

                  InkWell(
                    child: ClipRRect (
                      borderRadius: BorderRadius.circular(25),
                      child: catImage != null
                          ? FadeInImage(
                          fadeInCurve: Curves.easeIn,
                          fadeInDuration: Duration(seconds: 2),
                          image: NetworkImage(catImage),
                          placeholder: AssetImage('assets/loadingCat.gif'),
                          height: 170,
                          width: 170,                          
                          fit: BoxFit.cover
                          )
                          : Container(),
                        ),                        
                        onTap: () {
                          navigateToAnimalPage('gato');
                        },
                      ),

                  InkWell(
                    child: ClipRRect (
                      borderRadius: BorderRadius.circular(25),
                      child: foxImage != null
                          ? FadeInImage(
                          fadeInCurve: Curves.easeIn,
                          fadeInDuration: Duration(seconds: 2),
                          image: NetworkImage(foxImage),
                          placeholder: AssetImage('assets/loadingFox.gif'),
                          height: 170,
                          width: 170,                          
                          fit: BoxFit.cover
                          )
                          : Container(),
                        ),                        
                        onTap: () {
                          navigateToAnimalPage('raposa');
                        },
                      ),                      
                ])
        )));
  }
}