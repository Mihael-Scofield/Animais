import 'package:cat_app/utils/FetchData.dart';
import 'package:flutter/material.dart';
import 'package:cat_app/model/Cats.dart';

class AnimalPage extends StatefulWidget {
  String chosenAnimal;

  AnimalPage(this.chosenAnimal);
  
  @override
  State<StatefulWidget> createState() {
    return AnimalPageState(this.chosenAnimal);
  }
}

class AnimalPageState extends State<AnimalPage> {
  // Titulo
  String chosenAnimal;
  AnimalPageState(this.chosenAnimal);
  String titlePage;

  // Scroll
  ScrollController _scrollController = new ScrollController();

  // Lista
  List<String> animalsImages = new List();
  CatList catList;
  String placeHolderAnimal;

  // Decide o titulo da pagina
  String decideTitlePage() {
    if (chosenAnimal == 'cachorro') {
      return "Cachorros amam abanar o rabo";
    }
    else {
      return "Gatos amam morder os donos";
    }
  }

  // Adiciona na lista um novo animal
  void addAnimalImage(String newAnimalUrl) {
    animalsImages.add(newAnimalUrl);
  }

  // Puxa uma imagem de animal
  void getAnimalImage() async {
    FetchData fetchData = new FetchData();
    if (chosenAnimal == 'cachorro') {
      String newDogImage = await fetchData.setDogImage();
      setState(() {
        addAnimalImage(newDogImage);
      });
    }
    else {
      String newCatImage = await fetchData.setCatImage();   
      setState(() {
        addAnimalImage(newCatImage);
      });   
    }
  }

  // Puxa oito imagens diferentes
  void fetchEight() {
    for (int i = 0; i < 8; i++) {
      getAnimalImage();
    }
  }

  // Retorna o animal utilizado como Place Holder
  String setPlaceHolderImage() {
    if (chosenAnimal == 'cachorro')  {
      return 'assets/loadingDog.gif';
    }
    else {
      return 'assets/loadingCat.gif';
    }
  } 

  @override
  
  // Estado inicial da pagina
  void initState() {
    super.initState();

    titlePage = decideTitlePage();
    placeHolderAnimal = setPlaceHolderImage();
    fetchEight();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchEight();
      }
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titlePage),
        ),

        
        body: GridView.builder(
            controller: _scrollController,
            itemCount: animalsImages.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {

              return InkWell(
                    child: ClipRRect (
                      borderRadius: BorderRadius.circular(25),
                      child: animalsImages[index] != null // First image is the placeholder
                          ? FadeInImage(
                          fadeInCurve: Curves.easeIn,
                          fadeInDuration: Duration(milliseconds: 1500),
                          image: NetworkImage(animalsImages[index]),
                          placeholder: AssetImage(placeHolderAnimal),
                          height: 100,
                          width: 100,                    
                          fit: BoxFit.cover
                          )
                          : Container()
                        ),
                      );

            }));
  }
}