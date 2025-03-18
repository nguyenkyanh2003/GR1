// with co the su dung nhieu class khac nhau extends chi ke thua duoc 1 lop cha
import 'Football.dart' show Football;
import 'Music.dart';
import 'Person.dart';
import 'ReadBook.dart';
class User2 extends Person with Football,Readbook,Music{
  int id=0;
  String name='';
  User2(this.id,this.name);
  void logFavorite(){
    logFootball();
    readBook();
    music();
  }
  
  @override
  void play() {
    // TODO: implement play
    print('override play');
  }
  
  @override
  void music1() {
    // TODO: implement music1
  }
}
extension MyExtension on User2
{
  void logExtension(){
    print("LogExtension");
  }
}