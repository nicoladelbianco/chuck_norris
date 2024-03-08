import 'dart:convert';

class ChuckNorris {
  String fact;
  String id;
  String createdAt;
  String category;
  ChuckNorris(
      {required this.fact,
      required this.id,
      required this.createdAt,
      required this.category});

  @override
  String toString() {
    return "ID: $id\nCreato il: $createdAt\nCategory: $category\nFact: $fact";
  }

  factory ChuckNorris.fromJson(String jsonString) {
    final json = jsonDecode(jsonString);
    final chuck = ChuckNorris(
        fact: json["value"],
        id: json["id"],
        createdAt: json["created_at"],
        category: json["categories"].toString());
    return chuck;
  }

  factory ChuckNorris.fromMap(Map<String, dynamic> map) {
    final chuck = ChuckNorris(
        fact: map["value"],
        id: map["id"],
        createdAt: map["created_at"],
        category: map["categories"].toString());
    return chuck;
  }
}
