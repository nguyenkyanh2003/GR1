import 'Adress.dart';
import 'City.dart';

class User1 implements City,Adress {
 int id = 0;
 String name ='';
 User1(this.id,this.name);
 
  @override
  void showCity() {
    // TODO: implement showCity
    print("override Show City");

  }
  
  @override
  void function1() {
    // TODO: implement function1
       print("override function1");
  }
  
  @override
  void showAdress() {
    // TODO: implement showAdress
    print("Override Adress");
  }
}