import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: UI(),
      )
    ),
    debugShowCheckedModeBanner: false,
  ));
}
class UI extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return UI2();
  }

}
class UI2 extends State<UI>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row( // thay thanh column thi se sap xep theo chieu doc
      children: [
        Expanded(// dung de xap sep bo cuc theo ty le
        flex: 1,// ty le container la 1
          child: Container(
            color:  Colors.green,
            height: 150,
          )
        ),
        SizedBox(width: 10,),// phan cach khoang trang giua cac Row hoac column
        Expanded(// dung de xap sep bo cuc theo ty le
        flex: 2,// ty le la 2
          child: Container(
            color:  Colors.blue,
            height: 150,
          )
        ),
        SizedBox(width: 10,),
        Expanded(// dung de xap sep bo cuc theo ty le
        flex: 3, //ty le 3
          child: Container(
            color:  Colors.red,
            height: 150,
          )
        ),
        
      ],
    );
  
  }
}
