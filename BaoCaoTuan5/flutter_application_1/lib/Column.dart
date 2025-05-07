import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
   home: SafeArea(
    child: Scaffold(
      body: UI(),
    )
    ),
    debugShowCheckedModeBanner: false,
  ));
}
class UI extends StatelessWidget{
  const UI({super.key});

  @override
  Widget build(Object context) {
    // TODO: implement build
    return Container(
      color: Colors.yellowAccent,
      child: Column(
         mainAxisSize: MainAxisSize.max,// nen
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,// can chinh theo chieu doc
         crossAxisAlignment: CrossAxisAlignment.start,// can chinh theo chieu ngang
       children: [
       
        ElevatedButton(onPressed: (){},
        style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white
        ),
        child: Text(
          'Colunm 1',
          style:  TextStyle(fontSize: 10),
      
        )
        ),
         SizedBox(
          width: 200,
           child: ElevatedButton(onPressed: (){},
                   style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.pink,
                   foregroundColor: Colors.white
                   ),
                   child: Text(
            'Colunm 2',
            style:  TextStyle(fontSize: 10),
                 
                   )
                   ),
         ), 
        ElevatedButton(onPressed: (){},
        style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white
        ),
        child: Text(
          'Colunm 3',
          style:  TextStyle(fontSize: 10),
      
        )
        ),
       ],
      ),
    );
  }

}