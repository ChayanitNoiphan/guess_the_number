import 'dart:convert';

void main(){
  //var p = Person('Chayanit', 'Noiphan', 21);
  var n = 'abc';
  var p = 100;

  // สร้างออบเจ็ค Product โดยใช้ข้อมูลที่ดึงจาก database
  var product = Product(n, p, orderCount: 10);// orderCount ต้องระบุเพราะเป็นpositional parameter เพราะเป็น name parameter

  print(product.name);
  print(product.price.toString());
  product.orderCount = 10;
  String text = '\u03c0';
  print(text);
}
class Product{
  final String name;
  final int price;
  int orderCount= 0; // name Parameter

  Product(this.name, this.price, {this.orderCount = 0});// constructor กำหนดค่าต่างๆใน object //
  // ใส่{} หมายถึงจะส่งตัว orderมาหรือไม่มาก็ได้ เเละต้องกำหนดค่าไว้ด้วย
  // ถ้าใส่ {requried this.orderCount = 0} ต้องส่งค่ามาด้วย
}
class Person{
  final String firstName;
  final String lastName;
  final int age;

    // shorthand, shortcut syntex ของภาษา Dart
  Person(this.firstName, this.lastName, this.age);


}


