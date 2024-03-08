import "package:http/http.dart" as http;
import "dart:convert";

import "models/chuck_norris.dart";

Future<ChuckNorris> getChuckCategory([String? category]) async {
  final url = "https://api.chucknorris.io/jokes/random?category=$category";

  final uri = Uri.parse(url);
  final data = await http.get(uri);
  final json = jsonDecode(data.body);
  return ChuckNorris(
      fact: json["value"],
      id: json["id"],
      createdAt: json["created_at"],
      category: json["categories"].toString());
}

Future<List<ChuckNorris>> getChuckQuery(String? query) async {
  List<ChuckNorris> listChuck = [];
  final url = "https://api.chucknorris.io/jokes/search?query=$query";

  final uri = Uri.parse(url);
  final data = await http.get(uri);
  final json = jsonDecode(data.body);
  for (var e in json["result"]) {
    listChuck.add(ChuckNorris(
        fact: e["value"],
        id: e["id"],
        createdAt: e["created_at"],
        category: e["categories"].toString()));
  }
  /*return ChuckNorris(
      fact: json["value"],
      id: json["id"],
      createdAt: json["created_at"],
      category: json["categories"][0]);
  */
  return listChuck;
}
