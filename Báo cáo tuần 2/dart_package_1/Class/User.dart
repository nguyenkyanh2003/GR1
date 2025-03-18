import 'dart:async';

class User{
  int id ;
  String name;
  //User(this.id,this.name);
  User.name(this.id,this.name);
  // cách khởi tạo thứ 2
  // User({required this.id,this.name ='hoa'});
  @override
  String toString() {
    // TODO: implement toString
    return "$id - $name";
  }
}