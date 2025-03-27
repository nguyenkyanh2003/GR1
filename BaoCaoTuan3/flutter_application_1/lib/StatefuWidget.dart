import 'package:flutter/material.dart';

void main()
{
 runApp(MaterialApp(
  home: SafeArea(child: Scaffold(
    body: Center(
      child: MyWdiget2(false)
    ),
  )),
  debugShowCheckedModeBanner: false,
 ));
}

class MyWdiget2 extends StatefulWidget{// co tuong tac voi ng dung
  final bool loading;

 MyWdiget2(  this.loading);
 
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyWdiget2State();
  }

}
class MyWdiget2State extends State<MyWdiget2>{
  late bool _localLoading;
  @override
  void initState(){
    super.initState();// ham goi sau khi khoi tao MyWige2 dung de khoi tao gia tri ban dau {
    // TODO: implement initState
    _localLoading = widget.loading;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return _localLoading ? CircularProgressIndicator() :  FloatingActionButton(onPressed: onClickButton);
 // ham FloatingActionButton la ham kick vao khi xu ly
  }
  void onClickButton()
  {
    setState(() {// load lai State moi chay lai ham build de thay doi giao dien ng dung
      _localLoading = true;
    });
  }

}