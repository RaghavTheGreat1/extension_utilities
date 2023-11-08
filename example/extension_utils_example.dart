import 'package:extension_utilities/extension_utilities.dart';
import 'package:extension_utilities/src/int.dart';
import 'package:extension_utilities/src/set.dart';

void main() {
  final list = ["Raghav", "Joshi", "@RaghavTheGreat1"];
  print(list.random(start: 1, end: 2));

  final set = {"Raghav", "Joshi", "@RaghavTheGreat1"};
  print(set.randomOrNull());

  print(5.random());
}
