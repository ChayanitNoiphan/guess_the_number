// ignore_for_file: avoid_print
import 'dart:math';

enum GuessResult {
  correct,
  tooHigh,
  tooLow;
}

class Game {// ชื่อคลาส กับชื่อไฟล์ไม่จำเป็นต้องเหมือนกัน
  static var myList = <int>[];
  final int answer;
  int _totalGuesses = 0;

  // constructor
  // initializer
  //Game(): answer = Random().nextInt(100) + 1, name = 'ชญานิศ';
  Game(var maxRandom) : answer = Random().nextInt(maxRandom) + 1 {
    //print('Answer is $answer');
  }

  GuessResult doGuess(int guess) {
    _totalGuesses++;

    if (guess == answer) {//ไม่ควรปริ้นในนี้
      return GuessResult.correct;
    } else if (guess > answer) {
      return GuessResult.tooHigh;
    } else {
      return GuessResult.tooLow;
    }
  }

  // getter
  int get totalGuesses {
    return _totalGuesses;
  }
}
