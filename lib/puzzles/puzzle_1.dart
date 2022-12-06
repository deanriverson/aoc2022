import 'dart:math';

import 'package:aoc2022/file_utils.dart';
import 'package:rxdart/rxdart.dart';

int _parseAndSum(xs) => xs.map((x) => int.tryParse(x) ?? 0).reduce((sum, x) => sum + x);

void puzzle_1a() async {
  final cals = await readLines('puzzle_1_input.txt').bufferTest((line) => line.isEmpty).map(_parseAndSum).toList();
  final maxCalories = cals.reduce(max);

  print('Puzzle 1a: $maxCalories is the most calories.');
}

void puzzle_1b() async {
  final cals = await readLines('puzzle_1_input.txt').bufferTest((line) => line.isEmpty).map(_parseAndSum).toList();
  final sortedCals = [...cals]..sort();
  final combinedCals = sortedCals.reversed.take(3).reduce((sum, a) => sum + a);

  print('Puzzle 1b: The top three elves have $combinedCals calories.');
}

/*

*/