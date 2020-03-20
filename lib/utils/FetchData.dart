import 'package:http/http.dart';
import 'package:cat_app/utils/CatApi.dart';
import 'package:cat_app/utils/DogApi.dart';
import 'package:cat_app/model/Cats.dart';
import 'dart:convert';  

class FetchData {
  Future<String> setDogImage() async {
    String dogImageUrl = await DogAPI().getDogBreeds();
    print(dogImageUrl);
    return (dogImageUrl);
  }

  Future<String> setCatImage() async {
    CatList catList;
    var catJson = await CatAPI().getSingleCatBreed();
    print(catJson);

    var catMap = json.decode(catJson);
    print(catMap);
    catList = CatList.fromJson(catMap);
    return (catList.breeds[0].url);
  }
}  