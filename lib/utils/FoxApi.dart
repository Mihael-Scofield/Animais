import 'network.dart';
import 'dart:convert';

const String foxImageAPIURL = 'https://randomfox.ca/floof/';

class FoxAPI {
  Future<dynamic> getFoxBreeds() async {
    Network network = Network('$foxImageAPIURL');
    var response = await network.getData();
    String message = json.decode(response)['image'];
    return message;
  }
}