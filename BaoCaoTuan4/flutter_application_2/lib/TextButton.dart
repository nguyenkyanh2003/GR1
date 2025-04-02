import 'package:flutter/material.dart';

void main()
{
runApp(MaterialApp(
  home: SafeArea(child: 
  Scaffold(
    body: MyWidget(),
    ),
  ),
    debugShowCheckedModeBanner: false,
    )
);
}
class MyWidget extends StatefulWidget{
  const MyWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyWidget2();
  }

}
// TextButton gom
// Text
// Colors
// click
// size: do lon button
// padding : can do rong button
// margin : can le button
// shape 
// shadow
// border 
// icon
// disable 
class MyWidget2 extends State<MyWidget>{
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(20),
      // nếu muốn disable thi chi can de onPressed: null,
      child: TextButton.icon(onPressed: (){// dung de khi click vao button
        print("Click text button");
      },
      style: TextButton.styleFrom(foregroundColor: Colors.pink,
      backgroundColor: Colors.green,
      // minimumSize: Size(200,80)// 2 thuoc tinh theo chieu ngang voi theo chieu doc 
      padding: EdgeInsets.all(30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),// tao hinh cho button lam cho goc tron hon
      ),
      elevation: 8,// độ bóng
      shadowColor: Colors.blue.withOpacity(0.5),// shadow là đổ bóng , withOpacity sét độ mờ của đổ bóng
     side: BorderSide(width: 2,color: Colors.deepOrange)// border là viền, width là độ dày của viền
      // disabledBackgroundColor: Colors.grey,
      // disabledForegroundColor: Colors.white,
      ),
      icon: Icon(Icons.add,size: 30),
      //  child đổi thành lable để dùng icons
      label: Text(
        "Text Button",
        style: TextStyle(
          fontSize: 28,
        ),
      )
      ),
    );
  }

}