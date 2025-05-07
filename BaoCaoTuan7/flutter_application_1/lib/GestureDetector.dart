import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            elevation: 10,
            title: Row(
              children: [
                Icon(
                  Icons.menu,
                ),
                SizedBox(width: 10,),
                Text("GestureDetector"),
              ],
            
            ),
            actions: [
              Icon(
                Icons.search,
              ),
            ],
          ),
          body: UI()
            
        )
      ),
      debugShowCheckedModeBanner: false,
    )
  );
}
class UI extends StatelessWidget {
  const UI({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      // GestureDetector là một widget giúp bắt được cái sự kiện hay nội dung tương tác lên nội dung bên trong nó
      //vd: Ontap , onPressed
      child: GestureDetector(
        onTap: () {
          print("Nội dung được tap!");
        },
        onDoubleTap: () {
          print("Bạn đã ấn 2 lần!");
        },
        onPanUpdate: (a){// di chuyển button
          print("di chuyển theo hướng:${a.delta}");
        },
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              "My Gesture Detector",
            ),
          ),
        ),
      )
    );
  }

}