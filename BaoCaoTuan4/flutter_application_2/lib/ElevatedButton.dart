import 'package:flutter/material.dart';

void main()
{
runApp(MaterialApp(
  home: SafeArea(child: Scaffold(
  body: MyWidget(),
  )
  ),
  debugShowCheckedModeBanner: false,
));
}
class MyWidget extends StatelessWidget{
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(// cho vao khung chua
    margin: EdgeInsets.all(10),// set khoang cach cua button voi vien
      child: ElevatedButton.icon(
        onPressed: (){// disable chi can de onPressed: null,
      print("Click the Elevated Button");
        },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,// mau nen
        foregroundColor: Colors.white,// mau chu
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)) // bo tron button
        ),
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.5),// do bong
        // minimumSize: const Size(240, 80),
        padding: EdgeInsets.all(20),
        side: BorderSide(width: 5, color: Colors.yellow),// vien cua button
        // disabledBackgroundColor: Colors.pink,
        // disabledForegroundColor: Colors.white.withRed(10),
        ),
        icon: Icon(Icons.edit,size: 30,),
      //  child
      label: Text(
        "Elevated Button",
        style: TextStyle(
          fontSize: 20,
        ),
       )
       ),
    );
  }
  
}