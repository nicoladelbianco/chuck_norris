import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:chuck_norris/models/chuck_norris.dart';
import 'package:csv/csv.dart' as csv;
import 'package:chuck_norris/chuck_norris.dart' as chuck_norris;

//final category = "dev";

void main(List<String> arguments) async {
  final dynamic data;
  final file = File("categories.csv").openRead();
  final categories = (await file
      .transform(utf8.decoder)
      .transform(csv.CsvToListConverter())
      .toList())[0];
  final randomCategory = categories[Random().nextInt(categories.length)];

  print("Write your query or press Enter to get a random joke");
  String? query = stdin.readLineSync();
  if (query != "") {
    List<ChuckNorris> data = await chuck_norris.getChuckQuery(query);
    for (var e in data) {
      print(e);
    }
  } else {
    data = await chuck_norris.getChuckCategory(randomCategory);
    print('$data');
  }
}
