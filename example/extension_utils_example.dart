import 'package:extension_utilities/extension_utilities.dart';

void main() {
  final list = ["Raghav", "Joshi", "@RaghavTheGreat1"];
  print(list.random(start: 1, end: 2));

  final set = {"Raghav", "Joshi", "@RaghavTheGreat1"};
  print(set.randomOrNull());

  print(10.random());

  print("india lifts the World cup in 2023".capitalizeAllWords());
}
