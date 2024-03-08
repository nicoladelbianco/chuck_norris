import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:csv/csv.dart' as csv;
import 'package:chuck_norris/chuck_norris_facts.dart' as chuck_norris;
import 'package:dotenv/dotenv.dart';

void main(List<String> arguments) async {
  final env = DotEnv()..load();
  final dynamic data;
  /*
  final file = File("categories.csv").openRead();
  final categories = (await file
      .transform(utf8.decoder)
      .transform(csv.CsvToListConverter())
      .toList())[0];
  */
  final categories = env["categories"]!.split(",");
  final randomCategory = categories[Random().nextInt(categories.length)];
  print("$randomCategory $categories");
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
