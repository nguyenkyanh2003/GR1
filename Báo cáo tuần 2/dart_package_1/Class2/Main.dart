import '../Class2/User.dart';

void main(){
  User user = User(1, 'Nam');
  user.id = 2;
  user.name = 'Hoa';
  print(user.toString());
  user.logInfor();
}