// ignore: file_names
class Dog{
  late String _name;//thêm kí tự "_" giống như private trong java
  late int _age;
  late String _color;
  // có thể khai báo: Dog(this.name,this.age,this.color)
  Dog(String name, int age,String color){
     this._name = name;
     this._age = age;
     this._color = color;

  }
  void bark(){
  print("${this._name} is saying 'go go'");
  }
 // Getter để truy cập từ bên ngoài.
 String get name => _name;
 /*  có thể viết thành  */
 /*  String get name {
    return _name;

  }  */
  
  // setter dữ liệu
  set name(String name){
    _name = name;
  }
  int get age
  {
    return _age;
  }
  set age(int age)
  {
    _age = age;
  }
  String get color{
    return _color;
  }
  set color(String color)
  {
    this._color = color;
  }

  }