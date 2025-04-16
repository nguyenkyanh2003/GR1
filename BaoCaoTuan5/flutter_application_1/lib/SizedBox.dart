import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: SafeArea(child: 
    Scaffold(
   body:  MyWidget(),
   ),
    ),
       debugShowCheckedModeBanner: false,
    ));
}
class MyWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox( // su dung khi da biet truoc kich thuoc 
     width: double.infinity,
     height: double.infinity,// gia tri vo cung
     child: ElevatedButton(  
      onPressed: (){},
      style:  ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
     child: Text(
      'Fultter',
      style: TextStyle(fontSize: 30),
     )
     )
    );
  }
  
}