import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: SafeArea(child: 
    Scaffold(
      body: MyWidget(),
    )),
  ));
}
class MyWidget extends StatelessWidget{
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(12),
      child: OutlinedButton.icon(onPressed: (){
        print("Click the Outline Button");
      } , 
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        // minimumSize: Size(300, 50),
        padding: EdgeInsets.all(50),// can chinh giao dien button
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      elevation: 10,// o dai cua bong
      shadowColor: Colors.pink,
      side: BorderSide(width: 2, color: Colors.black),// set mau vien button
      ),
      icon: Icon(
        Icons.edit,
        size: 30,
      ),
      label: Text(
        'Outline Button',
        style: TextStyle(
          fontSize: 28,
      
        ),
      )
      ),
    );
  }
}