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
}
