import 'dart:io';
import 'dart:math';

void main(){
  const pi = 3.14; // compile-time constant เอาค่าไปแทนที่ไว้ก่อน ก่อน compile จริง
  final pi2 = 3.14; // กำหนดค่าได้เเค่ครั้งเดียว ไม่สามารถเเก้ไขค่าได้

  var r = Random();
  var answer = r.nextInt(100) + 1;
  //int? guess;
  var isCorret = false;

  do {
    //print('Guess the number between 1 and 100 : ');
    stdout.write('Guess the number between 1 and 100 : '); //ให้ต่อกัน โดยไม่ขึ้นบรรทัดใหม่
    var input = stdin.readLineSync();

    if (input == null) { //ดักไว้เพื่อว่าจะมีเป็นnull
      print('Error, input is NULL');
      return;
    }
    var guess = int.tryParse(input); // ถ้ามีเงื่อนไขเช็คเเล้ว ไม่ต้องใส่ ! //เช็คว่าเป็นตัวเลข ถ้าเป็นเอบีซีหรือ 12เอบี จะเป็นnull

    if (guess == null) {
      print('Invalid input, please enter numbers only');
      continue;//ไม่ออกจากลูป เเต่ไปเริ่มที่ do อีกครั้ง
    }

    // todo : call doGuess
    isCorret = doGuess(guess, answer);

  }while(!isCorret);
}

bool doGuess(int guess, int answer){
  if (guess == answer) {
    print('CORRECT! The answer is $answer'); //ถ้ามีการบวกให้ใส่ปีก {answer + 1}
    return true;
  } else if (guess > answer) {
    print('TOO HIGH');
    return false;
  } else {
    print('TOO LOW');
    return false;
  }
}



// เรียนภาษา dart เริ่มต้น
//import 'dart:math';
/*import 'dart:math';

// top-level variable
var x = 10;

// top-level function
void main(){
  //List myList = [1, 2, 3]; // list literal(literal ก็คือจะเห็นค่าที่กำหนด)
  // type inference (เป็นการกำหนด type จากที่กำหนดค่าเริ่มต้น)
  var i = 123;
  var s = 'สวัสดี $i'; //interpolate = แทรก

  //Random r = Random();
  //var r2 = Random();
  print(s);


  dynamic d; // เป็นตัวแปร ประเภท Dynamic
  d = 123;
  d = "Hello";
  d = Random();
  d = false;
  d = "Chayanit";

  d.toLowerCase();
  print(d.toLowerCase());

  int? p; // ต้องใส่เครื่องหมาย ? ถ้าต้องการให้เป็น null (null safety)
  p = 12;
  p = null; //int กับ int? ไม่สอดคล้องกันไม่สามารถใช้ร่วมกันได้

}*/
