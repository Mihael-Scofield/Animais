import 'network.dart';

const String apiKey = 'b0b50737-9606-40bb-96a5-189fba447a6d';
const String catAPIURL = 'https://api.thecatapi.com/v1/breeds?';
const String catImageAPIURL = 'https://api.thecatapi.com/v1/images/search?';
const String breedString = 'breed_id=';
const String apiKeyString = 'x-api-key=$apiKey';

class CatAPI {
  Future<dynamic> getCatBreeds() async {
    Network network = Network('$catAPIURL$apiKeyString');
    var catData = await network.getData();
    return catData;
  }

  Future<dynamic> getCatBreed(String breedName) async {
    Network network =
        Network('$catImageAPIURL$breedString$breedName&$apiKeyString');
    var catData = await network.getData();
    return catData;
  }

  Future<dynamic> getSingleCatBreed() async {
    Network network =
        Network('$catImageAPIURL');
    var catData = await network.getData();
    return catData;
  }
}
