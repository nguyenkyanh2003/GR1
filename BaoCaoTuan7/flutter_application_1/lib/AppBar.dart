import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home:  SafeArea(
      child: appbar()
        ),
        debugShowCheckedModeBanner: false,
      ) 
    );
}
class appbar  extends StatefulWidget {
  const appbar({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return appbar2();
  }

}
class appbar2 extends State<appbar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Tiêu đề
        title: Text(
        "AppBar",
        ),
        // màu nền
        backgroundColor: Colors.blue,
        // độ bóng của appbar
        elevation: 4,
        // chiều cao của appbar
        toolbarHeight:30 ,
        // nút nhấn của appbar
        actions: [
          IconButton(onPressed: (){
            print("Bạn đã ấn nút");
            }, 
          icon: Icon(Icons.search),
          ),
          Icon(Icons.abc),
          IconButton(onPressed: (){print("Bạn đã ấn nút ...");}, 
          icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Text("Nội dung chính"),
      ),
    );
    
  }

}