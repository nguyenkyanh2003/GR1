import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Row(
            children: [
              Icon(
                Icons.arrow_back,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed:(){},
             icon: Icon(
              Icons.restore_sharp,
             )
            ),
          ],
        ),
        bottomNavigationBar:BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Cá nhân"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "Tìm kiếm"),
          ],
        ),
        body: HomePage(),
      ) ,
    ),
    debugShowCheckedModeBanner: false,
  ));
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState()=> _HomePage();

}
class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(16.0),
   child: Column(
    children: [
      SizedBox(height: 100,),
      Row(
        children: [
          SizedBox(width: 100,),
          Text("Trang chủ"),
          
        ],
      ),
    ],
   )
    );
  }

}