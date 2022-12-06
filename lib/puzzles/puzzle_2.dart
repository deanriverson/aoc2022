/*
 * Copyright (c) 2022 Virginia Tech Transportation Institute.  All rights reserved.
 */

import 'package:aoc2022/file_utils.dart';

int _playerMoveIndex(String move) => move.codeUnitAt(0) - 'X'.codeUnitAt(0);
int _opponentMoveIndex(String move) => move.codeUnitAt(0) - 'A'.codeUnitAt(0);

class Move {
  final int id;
  final int beats;

  const Move(this.id, this.beats);
}

const moves = [Move(1, 3), Move(2, 1), Move(3, 2)];

int _compareMoves(Move opponentMove, Move playerMove) {
  if (opponentMove.id == playerMove.id) {
    return 3;
  }
  return playerMove.beats == opponentMove.id ? 6 : 0;
}

int _calcRoundScore(Move opponentMove, Move playerMove) {
  final outcome = _compareMoves(opponentMove, playerMove);
  return outcome + playerMove.id;
}

/// Return the playerMove based on the opponent's move and a desired outcome.
///
/// desiredOutcome values: 'X' == lose, 'Y' == draw, 'Z' == win
Move _outcomeToPlayerMove(Move opponentMove, String desiredOutcome) {
  switch (desiredOutcome) {
    case 'X':
      return moves[opponentMove.beats - 1];
    case 'Y':
      return opponentMove;
    default:
      return moves.firstWhere((move) => move.beats == opponentMove.id);
  }
}

/// Calculate round result by directly comparing moves in each match
int compareMovesReducer(total, move) {
  final opponentMoveIndex = _opponentMoveIndex(move[0]);
  final playerMoveIndex = _playerMoveIndex(move[1]);
  return total += _calcRoundScore(moves[opponentMoveIndex], moves[playerMoveIndex]);
}

/// Calculate round result based on the desired outcome of each match.
int desiredResultReducer(total, move) {
  final opponentMoveIndex = _opponentMoveIndex(move[0]);
  final opponentMove = moves[opponentMoveIndex];
  return total += _calcRoundScore(opponentMove, _outcomeToPlayerMove(opponentMove, move[1]));
}

void puzzle_2a() async {
  final lines = await readLines('puzzle_2_input.txt').map((line) => line.split(' ')).toList();
  final roundResult = lines.fold<int>(0, compareMovesReducer);

  print('Puzzle 2a: The total score of rounds is $roundResult.');
}

void puzzle_2b() async {
  final lines = await readLines('puzzle_2_input.txt').map((line) => line.split(' ')).toList();
  final roundResult = lines.fold<int>(0, desiredResultReducer);

  print('Puzzle 2b: The total score of rounds is $roundResult.');
}
