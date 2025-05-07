import 'package:flutter/material.dart';

void main(){
   runApp(MaterialApp(
    home: SafeArea(child: Scaffold(
      body: Center( child: MyWidget()
      )
    )
    ),
    debugShowCheckedModeBanner: false,
   ));
}
class MyWidget extends StatelessWidget{
  const MyWidget({super.key});

  @override
  Widget build(Object context) {
    // TODO: implement build
   return const Text('Mocking an interface is an excellent way to get started with a visual'
 'framework like Flutter. There are many ways to design an interface, ranging'
 'from free online tools to dedicated applications specifically created for'
 'Flutter.',
 textDirection: TextDirection.ltr,// Huong cua text ltr tu trai sang phai
 textAlign: TextAlign.right,//can phai .Center can giua, justify can bang 2 ben
  maxLines: 3,// chi hien thi 3 dong
  overflow: TextOverflow.ellipsis,//.clip: chi hien thi trong khung, .ellipsis: neu qua dai se co ... o cuoi
   // .fade: lam mo , visible: lam tran ra khoi khung chua
   // ignore: deprecated_member_use
   textScaleFactor: 1.5,// lam chu to len
   );
  }

}
