import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home:  SafeArea(
      child: Scaffold(
        body: Date(),
      )
    )
  ));
}
class Date extends StatefulWidget {
  const Date({super.key});

  @override
  State<StatefulWidget> createState() => _Date();
    
  

}
class _Date extends State<Date> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}