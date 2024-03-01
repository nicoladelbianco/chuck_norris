import "package:http/http.dart" as http;
import "dart:convert";

import "models/chuck_norris.dart";

Future<ChuckNorris> getChuck([String? category]) async {
  final String url;
  if (category != null) {
    url = "https://api.chucknorris.io/jokes/random?category=$category";
  } else {
    url = "https://api.chucknorris.io/jokes/random";
  }

  final uri = Uri.parse(url);
  final data = await http.get(uri);
  final json = jsonDecode(data.body);
  return ChuckNorris(
      fact: json["value"], id: json["id"], createdAt: json["created_at"]);
}