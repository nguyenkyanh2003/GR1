
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main()
{
  runApp(MaterialApp(
    locale: const Locale('vi'),
    supportedLocales: const [
      Locale('vi'),
    ],
    localizationsDelegates: [
     GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
    ],
    home: SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: (){
                print("Bạn đã ấn icon!");
              },
              child: Icon(
                Icons.apps,
              ),
            ),
            SizedBox(width: 10,),
            Text(
              "Text Field",
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.close,
          )
        ],
        backgroundColor: Colors.yellow,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Trang chủ",),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Tìm kiếm"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá nhân")
        ],
      ),
      body: UI(),
      ), 
    ),
    debugShowCheckedModeBanner: false,
  ));
}
class UI extends StatelessWidget {
  const UI({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      // TextField là một widget cho phép người dùng nhập văn bản 
      // thông qua bàn phím. Đây là thành phần thiết yếu cho các ứng dụng
      // từ biểu mẫu đăng nhập, tìm kiếm , nhập dữ liệu.
      
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,// căn giữa theo chiều dọc,
          crossAxisAlignment: CrossAxisAlignment.center,// căn giữa theo chiều ngang
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              style: TextStyle(
                fontFamily: 'Roboto',
              ),
              decoration: InputDecoration(
                labelText: "Họ và Tên",
                hintText: "Nhập vào tên của bạn",
                border: OutlineInputBorder(),// tạo đường viền
              ),
            ),
            SizedBox(height: 30,),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Example@gmail.com",
                helperText: "Nhập vào Email cá nhân",// ghi chú ở dưới boder
                prefixIcon: Icon(
                  Icons.email
                ),
                suffixIcon: Icon(
                  Icons.clear,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                // tô màu cho textField
                filled: true,
                fillColor: Colors.greenAccent
              ),
              keyboardType:  TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Số điện thoại",
                hintText: "Nhập vào SĐT của bạn",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,// định hình dạng bàn phím khi ng dùng chọn
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                labelText: "Ngày sinh",
                hintText: "Nhập vào ngày sinh của bạn",
              border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,// kiểu nhập vào là số
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                labelText: "Mật khẩu",
                hintText: "Nhập mật khẩu của bạn",
              border: OutlineInputBorder(),
              ),
              obscureText: true,// ẩn text khi nhập vào phục vụ cho mật khẩu
              obscuringCharacter: "*",// tạo kiểu obscureText
            ),
            // bắt sự kiện của widget
             SizedBox(
              height: 10,
             ),
             TextField(
              // hiên thị nội dung khi nhập
              onChanged: (value){
                print("Nội dung đã nhập: $value");
              },
              // khi nhập xong ấn enter sẽ hiện sự kiện
              onSubmitted: (value){
                print("Đã nhập thành công: $value");
              },
              decoration: InputDecoration(
                labelText: "Câu hỏi bí mật",
                hintText: "Nhập câu hỏi",
                border: OutlineInputBorder(),
              ),
             ),
          ],
        ),
      ),
    );
  }

}