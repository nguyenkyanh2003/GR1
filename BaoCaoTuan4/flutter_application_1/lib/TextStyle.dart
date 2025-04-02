import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: SafeArea(child: Scaffold(
      body : Center(child: myWdiget(),

      )
    ),
      
    ),
    debugShowCheckedModeBanner: false,
  ));
}
class myWdiget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return const Text(
    'Triết học là một loại hình nhận thức đặc thù của con người, triết'
    ' học ra đời ở cả Phương Đông và Phương Tây gần như cùng một thời gian'
     ' (khoảng từ thế kỷ VIII đến thế kỷ VI tr.CN) tại các trung tâm văn '
      'minh lớn của nhân loại thời Cổ đại. Ý thức triết học xuất hiện'
      ' không ngẫu nhiên, mà có nguồn gốc thực tế từ tồn tại xã hội với'
       ' một trình độ nhất định của sự phát triển văn minh, văn hóa và'
        ' khoa học. Con người, với kỳ vọng được đáp ứng nhu cầu về nhận'
         ' thức và hoạt động thực tiễn của mình đã sáng tạo ra những luận '
          'thuyết chung nhất, có tính hệ thống phản ánh thế giới'
           'xung quanh và thế giới của chính con người. Triết học là dạng'
            'tri thức lý luận xuất hiện sớm nhất trong lịch sử các loại'
           '  hình lý luận của nhân loại.',
           textDirection: TextDirection.ltr,
           textAlign: TextAlign.center,
           style: TextStyle(
            fontSize: 12,// size chu
            color: Colors.black,// mau chu
            fontWeight: FontWeight.w400,// do dam nhat cua text
            fontStyle: FontStyle.normal,// italic chu in nghieng
            fontFamily: 'Times New Roman',// font cho chu
            //wordSpacing: 20, chinh khoang cach giua cac tu
            //letterSpacing: 10, chinh khoang cach giua cac ki tu
            decoration: TextDecoration.underline,//gach chan o ben duoi

           ),
   );
  }

}