import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:csv/csv.dart' as csv;
import 'package:chuck_norris/chuck_norris.dart' as chuck_norris;

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
    data = await chuck_norris.getChuckQuery(query);
  } else {
    data = await chuck_norris.getChuckCategory(randomCategory);
  }

  if (data != null) {
    print(data);
    final fileWrite = File("facts.txt").openWrite();
    fileWrite.write(data);
  } else {
    print("ERRORE");
  }
}
