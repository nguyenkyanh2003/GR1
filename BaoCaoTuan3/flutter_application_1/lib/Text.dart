import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: SafeArea(child: 
    Scaffold(
      body: Center(child: MyWidget())
    )),
    debugShowCheckedModeBanner: false,
  ));
}
class MyWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text( '- Flutter Engine: Flutter Engine là một môi trường chạy di động linh hoạt dành cho các ứng dụng chất lượng cao, '
        'chủ yếu được xây dựng bằng ngôn ngữ lập trình C++. Nó bao gồm hệ thống hoạt ảnh và đồ họa, quản lý tệp và I/O mạng, '
        'kiến trúc plugin, hỗ trợ truy cập và một trình runtime Dart để viết, biên dịch và thực thi các ứng dụng Flutter. '
        'Flutter Engine sử dụng Skia, một thư viện đồ họa mã nguồn mở của Google, để tạo ra các hình ảnh đồ họa cấp thấp.\n\n'
        '- Foundation Library: Thư viện Foundation cung cấp tất cả các gói cần thiết để xây dựng các khối cơ bản của một ứng dụng Flutter. '
        'Các thư viện này được viết bằng ngôn ngữ lập trình Dart.\n\n'
        '- Widgets: Mọi thứ trong Flutter đều là widget, đây là khái niệm cốt lõi của framework. Trong Flutter, widget là một thành phần giao diện người dùng (UI), '
        'có ảnh hưởng và kiểm soát cách hiển thị cũng như tương tác của ứng dụng. Widget là một mô tả bất biến của một phần giao diện người dùng, '
        'bao gồm đồ họa, văn bản, hình dạng và hiệu ứng.',
        style: TextStyle(
          fontSize: 14,// co chu
          fontWeight: FontWeight.bold,// do dam
          fontStyle: FontStyle.italic,// kieu chu in nghieng
          letterSpacing: 2.0,// khoang cach giua cac chu
          wordSpacing: 5.0,// khoang cach giua cac tu
          color: Colors.pink,// mau chu

        ),
        textAlign: TextAlign.left,// can trai
        textDirection: TextDirection.ltr,// trai sang phai
        softWrap: true,// co xuong dong tu dong hay k
        
        );
  }
}