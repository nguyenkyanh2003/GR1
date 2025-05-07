import 'People.dart';
class User extends People{
 int id = 0;
 String name = '';
User(this.id,this.name);
void logInfor()
{
  print("$id - $name");
}

  @override
  void function1() {
    // TODO: implement function1
    print("override function1");
  }
  @override
  void function2() {
    // TODO: implement function2
    // super.function2();
    print('override function2');
  }
}