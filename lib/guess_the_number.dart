// ignore_for_file: avoid_print

import 'dart:io';
import 'game.dart';

void main(){
  var game = Game(10000,"s",18);
  late GuessResult guessResult;
  var l1 = line1();

  do {
    stdout.write('\u2551 Guess the number between 1 and 100 : ');
    var input = stdin.readLineSync();

    if (input == null) {
      //print('Error, input is NULL');
      return;
    }
    var guess = int.tryParse(input);

    if (guess == null) {
      //print('Invalid input, please enter numbers only');
      continue;
    }
  guessResult = game.doGuess(guess);

    if(guessResult == GuessResult.correct){
      stdout.write('\u2551 \u27F6 $guess is CORRECT \u2665');
      stdout.write(' total guesses : ${game.totalGuesses} \u26C4');
      print('');
      var l2 = line2();
      var l3 = line3();
    } else if(guessResult == GuessResult.tooHigh){
      print('\u2551 \u27F6 $guess is TOO HIGH! \u25B2');
      var l2 = line2();
    }else {
      print('\u2551 \u27F6 $guess is TOO LOW! \u25BC');
      var l2 = line2();
    }
  } while (guessResult != GuessResult.correct);
}

void line1() {
  stdout.write('\u2554');
  for (int i = 0; i < 50; i++) {
    stdout.write('\u2550');
  }
  print('');
  print('\u2551                 GUESS THE NUMBER');
  var l2 = line2();
}

void line2() {
  stdout.write('\u255F');
  for (int i = 0; i < 50; i++) {
    stdout.write('\u2500');
  }
  print('');
}

void line3() {
  print('\u2551                  THE END  \u263B');
  stdout.write('\u255A');
  for (int i = 0; i < 50; i++) {
    stdout.write('\u2550');
  }
}