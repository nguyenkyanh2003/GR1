import 'Person.dart';

mixin Music on Person {// gioi han su dung mixins chi khi ke thua person moi su dung dc music
  void music1();
  void music()
  {
    print('Music');
  }
}