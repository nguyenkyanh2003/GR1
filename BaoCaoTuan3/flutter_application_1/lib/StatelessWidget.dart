import 'package:flutter/material.dart';

void main()
{
 runApp(MaterialApp(
  home: SafeArea(child: Scaffold(
    body:Center(child: MyWidge(false))
  ))
 ));

}
class MyWidge extends StatelessWidget{// Khi ko co tuong tac voi ng dung
  final bool loading;
  const MyWidge(this.loading, {super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  //  if(loading)
  //  {
  //   return const CircularProgressIndicator();
  //  }
  //  else{
  //   return const Text('State');
  //  }
  return loading ? CircularProgressIndicator() : Text('State');
  }
}