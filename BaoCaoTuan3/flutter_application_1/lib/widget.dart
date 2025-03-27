import 'package:flutter/material.dart';

void main()
{
runApp(MaterialApp(
home: SafeArea(child: Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.red,
    title: Text('Tu hoc Flutter'),
  ),
  body: const Center(
    child: Text('Hello Word'),
  ),
)
),
debugShowCheckedModeBanner: false,
));
    
}