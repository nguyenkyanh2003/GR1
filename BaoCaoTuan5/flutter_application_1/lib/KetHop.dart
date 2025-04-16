import 'package:flutter/material.dart';

void main()
{
runApp(MaterialApp(
home:  SafeArea(
  child: Scaffold(
    body: UI(),
  )
),
debugShowCheckedModeBanner: false,
));
}
class UI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
    padding: const EdgeInsets.all(10),// can le 10px
    child:  Column(
      children: [
      Row(
        children: const [
    SizedBox(
      width: 80,
      child: Text("UserName:",style: TextStyle(fontSize: 14,color: Colors.grey),),
    ),
     Text(
  "Nguyễn Kỳ Anh",
  style: TextStyle(
    fontSize: 14,
    color: Colors.black,
  )
     )
        ]
      ),
      Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              "Email: ",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          Text("nguyenkyanh22122003@gmail.com",
          style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          ),
          )
        ],
      ),
      Row(
        children: [
          SizedBox(
         width: 80,
         child: Text(
          "Address: ",
          style:  TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
         ),
          ),
          Text("Hai Bà Trưng - Hà Nội",
          style: TextStyle(
            fontSize: 14,
            color:  Colors.black,
          ),
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed:(){},
              style: ElevatedButton.styleFrom(// style ElevatedButton
            backgroundColor: Colors.red,
            foregroundColor: Colors.red,
            ),
            child: const Text(
              "Cancel",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ) ,
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            flex: 1,
            child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              foregroundColor:  Colors.green,
            ),
             child: const Text(
              "Submit",
              style: TextStyle(
                fontSize: 14,
                color:  Colors.white,
              ),
             ) ,
             ),
            ), 
        ]
      ),
    ]
   )
    );
  }
}