class User{
  int _id = 0;// để private
  String _name = 'default';// để private
  User(this._id,this._name);
  @override
  String toString() {
    // TODO: implement toString
    return "$_id - $_name";
  }
  int get id => _id;
  set id(int id)
  {
    this._id = id;
  }
  String get name => _name;
  set name(String name)
  {
    this._name = name;
  }
  void logInfor()
  {
    print("Ky Anh");
  }
}