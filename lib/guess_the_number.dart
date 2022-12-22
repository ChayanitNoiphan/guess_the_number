// ignore_for_file: avoid_print

import 'dart:io';

import 'game.dart';

void main() {
  late GuessResult guessResult;
  var ask = '';

  stdout.write('Enter a maxvalue number to random: ');
  var max = stdin.readLineSync();
  var maxRandom = int.tryParse(max!);

  var game = Game(maxRandom);

  print('╔══════════════════════════════════════════════════');
  print('║                GUESS THE NUMBER                  ');
  print('║──────────────────────────────────────────────────');

  do {
    stdout.write('║  Guess the number between 1 and 100 : ');

    var input = stdin.readLineSync();

    if (input == null) {
      //print('Error, input is NULL');
      return;
    }

    var guess = int.tryParse(input);

    if (guess == null) {
      //print('Input error, please enter numbers only');
      continue;
    }

    guessResult = game.doGuess(guess);

    if (guessResult == GuessResult.correct) {
      Game.myList.add(game.totalGuesses);
      print('║  ➜ $guess is CORRECT ❤, total guesses: ${game.totalGuesses}');
      print('║──────────────────────────────────────────────────');
      print('║                    THE END                       ');
      print('╚══════════════════════════════════════════════════');
    } else if (guessResult == GuessResult.tooHigh) {
      print('║  ➜ $guess is TOO HIGH! ▲');
      print('║──────────────────────────────────────────────────');
    } else {
      print('║  ➜ $guess is TOO LOW! ▼');
      print('║──────────────────────────────────────────────────');
    }
    while (guessResult == GuessResult.correct) {
      stdout.write('Play again? (Y/N): ');
      ask = stdin.readLineSync()!;

      if (ask == 'Y' || ask == 'y') {
        stdout.write('Enter a maxvalue number to random: ');
        max = stdin.readLineSync();
        maxRandom = int.tryParse(max!);

        game = Game(maxRandom);

        print('╔══════════════════════════════════════════════════');
        print('║                GUESS THE NUMBER                  ');
        print('║──────────────────────────────────────────────────');
        break;
      } else if (ask == 'N' || ask == 'n') {
        print('You have played ${Game.myList.length} games');

        for (int i = 0; i < Game.myList.length; i++) {
          print('🚀 Game #${i + 1}: ${Game.myList[i]} guesses');
        }
        return;
      }
    }
  } while (guessResult != GuessResult.correct || ask == 'Y' || ask == 'y');
}
