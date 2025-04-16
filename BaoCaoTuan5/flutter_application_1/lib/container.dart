import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: Center(
          child: MyWidget(),
        ), 
      )
    ),
    debugShowCheckedModeBanner: false,
  ));
}
class MyWidget extends StatefulWidget{
  const MyWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return Mywidget1();
  }

}
// color
// khi khong/ co child -> neu khong co child thi container chua toan bo man hinh
// size: wight, height
// alignment, Alignment, AlignmentDirectional , FractionalOffset
// pading
// margin
// decoration: color , shape, borderRadius, boder
class Mywidget1 extends State<MyWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Container(
      // color: Colors.blueAccent,
      width: 200,// chieu rong
      height: 200,// chieu cao
      padding:const EdgeInsets.all(15),// can le 15px
      margin: const EdgeInsets.all(20),// can xung quanh 20px
      alignment: Alignment.centerLeft,// chinh text o giua container
      // cach 2 const Alignment(1.0,1.0) goc duoi phai , truc x,y
        decoration:  BoxDecoration(
          shape: BoxShape.rectangle,// tạo hình
          color:  Colors.blue,// màu nền
          borderRadius:const BorderRadius.all(Radius.circular(20)),// bo góc xung quanh
          border: Border.all(width: 5,color: Colors.red),// viền
        ),
        transform: Matrix4.rotationZ(0.2),// xoay container
        child: const Text("Ky Anh",
        style: TextStyle(
          fontSize: 30,
          color: Colors.white
        ),
        ),
      
     );
  }

}