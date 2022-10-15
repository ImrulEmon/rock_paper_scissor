//while true
// Show prompt
//  Read user input from console
//  if input is valid move('r','p','s')
//    choose the AI move at random
//    compare the player move with the AI move
//    Show the result
//  else if input is 'q'
//    Quit the game
//  else
//    Invalid Input

import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Write Player name : ');
  final playerName = stdin.readLineSync();
  final rng = Random();
  while (true) {
    stdout.write('Rock,Paper,Scissor? (r/p/s) : ');
    final input = stdin.readLineSync();

    if (input == 'r' || input == 'p' || input == 's') {
      var playerMove;

      if (input == 'r') {
        playerMove = Move.rock;
      } else if (input == 'p') {
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissor;
      }

      final random = rng.nextInt(3);
      final aiMove = Move.values[random];

      print('$playerName played: $playerMove');
      print('AI played : $aiMove');

      if (playerMove == aiMove) {
        print("\x1B[34m It's a Draw \x1B[0m");
      } else if (playerMove == Move.rock && aiMove == Move.scissor ||
          playerMove == Move.paper && aiMove == Move.rock ||
          playerMove == Move.scissor && aiMove == Move.paper) {
        print("\x1B[32m Congratulations,$playerName ! You Win ! ! ! \x1B[0m");
      } else {
        print('\x1B[31m Sorry,$playerName!You lose ! Try again! ! ! \x1B[0m');
      }
    } else if (input == 'q' || input == 'Q') {
      break;
    } else {
      print('Invalid Input');
    }
  }
}

enum Move { rock, paper, scissor }
