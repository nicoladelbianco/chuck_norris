import "dart:convert";

import "package:http/http.dart" as http;
import "models/chuck_norris.dart";

Future<dynamic> getJson(String url) async {
  final uri = Uri.parse(url);
  final data = await http.get(uri);
  return data.body;
}

Future<ChuckNorris> getChuckCategory(String category) async {
  final url = "https://api.chucknorris.io/jokes/random?category=$category";

  final jsonString = await getJson(url);
  return ChuckNorris.fromJson(jsonString);
}

Future<List<ChuckNorris>> getChuckQuery(String? query) async {
  final url = "https://api.chucknorris.io/jokes/search?query=$query";

  final jsonString = await getJson(url);
  final List listJson = json.decode(jsonString)["result"];
  final listChuck = listJson.map((e) => ChuckNorris.fromMap(e)).toList();
  return listChuck;
}
