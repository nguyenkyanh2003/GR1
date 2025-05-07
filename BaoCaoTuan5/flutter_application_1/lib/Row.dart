import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
         body:  UI(),
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,//cho phep cuon ngang
        //   child: UI(),
        // )
        
      ) ,
      ),
      debugShowCheckedModeBanner: false,
  ));
}
class UI extends StatelessWidget{
  const UI({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
    color: Colors.orange,
     child: Row(// bao quanh sap xep thanh phan ben trong theo chieu ngang
      mainAxisSize: MainAxisSize.max,//MainAxisSize.min bao quanh container
      // khi dung MainAxisSize.max background se toan bo man hinh hang ngang cua row
      mainAxisAlignment:MainAxisAlignment.spaceEvenly ,// cat chinh
      //MainAxisAlignment.start can tu trai qua phai
      // MainAxisAlignment.end can tu phai qua trai
      //MainAxisAlignment.center can giua
      // MainAxisAlignment.spaceBetween cach deu nhau nhung khong cach le 2 ben
      //MainAxisAlignment.spaceEvebly cach deu tat ca
      // MainAxisAlignment.spaceAround tao ra nhung padding khoang cach bang nhau
      crossAxisAlignment: CrossAxisAlignment.center,// can theo chieu doc
      children: [
        ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
           child: Text('Flutter 1',style: TextStyle(fontSize: 10),
           )
           ),
            SizedBox(
              height: 100,
              child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
                        ),
                         child: Text('Flutter 2',style: TextStyle(fontSize: 10),
                         )
                         ),
            ),
            ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
           child: Text('Flutter 3',style: TextStyle(fontSize: 10),
           )
           )
      ],
     ),
   );
  }

}