import 'package:flutter/material.dart';
import 'package:flutter_application_1/TextStyle.dart';

void main(){
runApp(MaterialApp(
  home: SafeArea(child: Scaffold(
   body: Center(
    child: MyWidget()),
  )
  ),
  debugShowCheckedModeBanner: false,
));
}
class MyWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
      return MyWidget2();
  }

}
class MyWidget2 extends State<MyWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Text(
    'Tôi là đàn em thân tín nhất của ông trùm xã hội đen.'
'Theo hắn sáu năm, xông pha chốn sinh tử không dưới mười lần.'
'Vết thương chất chồng, tôi cũng học được cách... làm biếng.'
'Nương tựa vào cái bóng Lục Vũ Triết, chẳng việc gì phải xông pha.'
'Đám đàn em đ/á/nh nhau, tôi hút th/uốc. Lão đại chỉ huy, tôi ngồi bụi rậm chơi game.'
'Trong hội, người ta nể tôi không sợ ch*t, lại thấy tôi dễ gần, dần gọi thân mật Lão nhị.'
'Hễ có ai cưới xin hay về quê, chúng không dám xin phép Lục Vũ Triết, chỉ tìm đến tôi.'
'Mang theo cả thùng rư/ợu Mao Đài.'
'Và combo pizza tôi thích nhất.'
'Tôi cười toe toét, nhận quà xong ngồi ăn ngay tại chỗ.'
"Lão nhị, việc này..."
'"Được, được hết!" Tôi nhét cho hắn hộp tiramisu, "Cứ yên tâm, tối nay anh đi tr/ộm con dấu cho! Đi đi."'
'Đàn em hớn hở ra về.'
'Không ngờ Lục Vũ Triết đang ngồi phòng khách nhà tôi.'
'Hắn bước ra nhìn bàn tiệc cao calorie, cười lạnh:'
'"Con dấu vàng 36K nguyên chất của tôi... chỉ đáng giá thế này?"'
'Tôi cười hì, đưa ly kem hai viên:'
'"Ki/ếm chút lộc lá thôi, cảm tạ đại ca!"',
textDirection: TextDirection.ltr,// tu trai qua phai
textAlign: TextAlign.right, // can le 
softWrap: true,
semanticsLabel: "Truyện kiếm hiệp",
    
    style: TextStyle(
   color:  Colors.black,
   fontFamily: "Times New Roman "
    ),
     );
  }
  
}