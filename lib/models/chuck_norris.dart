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
