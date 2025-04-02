import 'package:flutter/material.dart';

void main()
{
runApp(MaterialApp(
   home: SafeArea(child: Scaffold(
    body:  MyWidget()
    ),
   ),
  debugShowCheckedModeBanner: false,
   ),
  
);
}
class MyWidget extends StatelessWidget{
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Card(
      color:  Colors.red,
     margin: EdgeInsets.all(100),// margin la tao khoang cach cua card voi le xung quanh
      child: Padding(// Padding la tao khoang cach voi chinh nd cua no
        // padding: EdgeInsets.all(30.0),// chinh tat ca card
       // padding: EdgeInsets.fromLTRB(50.0, 10.0 ,50.0, 10.0),// tu chinh cac chieu cua card
       //padding: EdgeInsets.only(left: 50,right: 20,top: 40,bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 50.0,horizontal: 50.0),// vertical chinh theo chieu doc horizontal chinh theo trieu ngang
        
        child: Text("Hello Work",
        style:  TextStyle(
          fontSize: 24,
          color:  Colors.white,
        ),
        ),
      ),
    );
  }

}