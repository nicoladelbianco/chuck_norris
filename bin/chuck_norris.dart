import 'dart:io';
import 'dart:math';
import 'package:chuck_norris/chuck_norris_facts.dart' as chuck_norris;
import 'package:dotenv/dotenv.dart';

void main(List<String> arguments) async {
  final env = DotEnv()..load();
  final dynamic data;
  final categories = env["categories"]!.split(",");
  final randomCategory = categories[Random().nextInt(categories.length)];

  print("Write your query or press ENTER to get a random joke");
  String? query = stdin.readLineSync();

  if (query == "") {
    data = await chuck_norris.getChuckCategory(randomCategory);
  } else {
    data = await chuck_norris.getChuckQuery(query);
  }

  if (data != null) {
    print(data);
    final fileWrite = File("facts.txt").openWrite();
    fileWrite.write(data);
  } else {
    print("ERRORE");
  }
}
