import 'package:chuck_norris/chuck_norris.dart' as chuck_norris;

final category = "dev";

void main(List<String> arguments) async {
  final data = await chuck_norris.getChuck(category);
  print('$data');
}
