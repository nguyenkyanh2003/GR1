import 'package:flutter/material.dart';

void main()
{
  runApp( MaterialApp(
    home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
               Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(width:10),
              Text(
                "InlWell",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ]   
          ),
            backgroundColor: Colors.green,
            actions: [
              Icon(
                Icons.timelapse,
              )
            ],
        ),
        body: UI(),
      ),
    ),
    debugShowCheckedModeBanner: false,
  )
  );
}
class UI extends StatelessWidget {
  const UI({super.key});

  @override
  Widget build(Object context) {
    // TODO: implement build
    return Center(
      // InkWell không phải button,
      // nhưng cho phép tạo hiệu ứng gợn sóng
      // khi nhấn vào bất kì widget nào
      child:  InkWell(
        onTap: (){
          print("InkWell đã được ấn!");
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
          ),
          child: Text(
            "Button tùy chỉnh với InkWell",
          ),
        ),

      ),
    );
  }

}