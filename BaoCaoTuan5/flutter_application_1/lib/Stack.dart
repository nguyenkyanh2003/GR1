import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
  home : SafeArea(
    child: Scaffold(
      body: UI(),
    )
  )
  ));
}
class UI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.grey,
      width: 500,
      height:  500,
      child:  Stack(// sắp xếp chồng
         // khi muốn tràn qua container to nhất thì dùng clipBehavior: Clip.none,
        fit: StackFit.loose,//StackFit.expand container khai báo cuối cùng sẽ full
        //StackFit.loose mặc định
        alignment: Alignment.center,// căn chỉnh container
        textDirection: TextDirection.ltr,
        children: [
            Container(
            color: Colors.blue,
            height: 300,
            width: 300,
            ),
            Positioned(
              left:  10,
              bottom: 10,// căn chỉnh container cách 2
              child: Container(
                        color: Colors.red,
                        width: 200,
                        height: 200,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,// căn chỉnh từng container
              child: Container(
                color: Colors.pink,
                height: 100,
                width: 100,
              ),
            ),
            Container(
              color: Colors.yellow,
              height: 70,
              width: 70,
            ),
              Container(
              color: Colors.white,
              height: 50,
              width: 50,
            )
          
        ],
      ),
    );
  }
  
}
// tính chất của stack là thằng đằng sau sẽ đè lên thằng đằng trước
