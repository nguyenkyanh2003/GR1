import 'package:flutter/material.dart';

void main(){
runApp(MaterialApp(
home: SafeArea(child: Scaffold(
  body: Center(child: MyWidget(),
  )
)
),
debugShowCheckedModeBanner: false,
));
}
class MyWidget extends StatelessWidget{
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(text: 
    TextSpan(
      style:  DefaultTextStyle.of(context).style,
      children: const <TextSpan>[
        TextSpan(text: "Hello"),
        TextSpan(text: "bold", 
        style: TextStyle(fontSize: 40,
         fontWeight: FontWeight.bold,
        color: Colors.blue)
        ),
        TextSpan(text: "Word!!!"),
      ]

    ));
   }
  
}