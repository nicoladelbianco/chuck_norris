import "package:http/http.dart" as http;
import "dart:convert";

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

class ChuckNorris {
  String fact;
  String id;
  String createdAt;
  ChuckNorris({required this.fact, required this.id, required this.createdAt});

  @override
  String toString() {
    return "ID: $id\nCreato il: $createdAt\nFact: $fact ";
  }
}
