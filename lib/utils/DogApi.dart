import 'network.dart';
import 'dart:convert';

const String dogImageAPIURL = 'https://dog.ceo/api/breeds/image/random';

class DogAPI {
  Future<dynamic> getDogBreeds() async {
    Network network = Network('$dogImageAPIURL');
    var response = await network.getData();
    String message = json.decode(response)['message'];
    return message;
  }
}