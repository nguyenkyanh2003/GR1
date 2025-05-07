import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
   runApp(
   MaterialApp(
    home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,// chiều cao của appbar
          centerTitle: true,
          title: Text("ĐĂNG NHẬP  ",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ) ,
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient:  LinearGradient(
                colors: [Colors.red,Colors.blue],
                begin:  Alignment.topLeft,
                end:  Alignment.bottomRight,
              )
            ),
          ),
        ),
        body: UI(),
      ),
      ),
      debugShowCheckedModeBanner: false,
   )
   );
}
class UI extends StatefulWidget{
  const UI({super.key});

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  bool _ghinho = false;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(// trang trí widget
        image: DecorationImage(
          image: AssetImage('assets/images/AnhNen.jpg'),
          fit: BoxFit.fill,
        )
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          // làm mờ ảnh nền
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
            child: Container(
              color: Colors.blue.withOpacity(0),
            ),
          ),
       Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
           child: SingleChildScrollView(// cho phép cuộn màn hình để xem hết nội dung
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,// căn giữa màn hình
              children: [
              //logo của giao diện
              Container(
                width:  60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),//tạo hiệu ứng bo góc của widget
                ),
                child: Icon(
                  Icons.restaurant_menu,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Eats and Treats",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: '',
                  fontWeight: FontWeight.bold,//in đậm
                  color: Colors.white,
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),//bo góc card
                ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    
                    // đăng nhập
                    TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                      CupertinoIcons.person_circle,
                      ),
                      labelText: "Email hoặc số điện thoại",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                      // suffix: Icon(
                      //   Icons.person,
                      //   size: 20,
                      // ),// hiển thị bên phải của TextField, bên phải là prefix
                    ),
                    
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: _obscureText,// neu true nd se hien thi la dau ...
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          CupertinoIcons.lock,
                        ),
                        labelText: "Mật khẩu",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffix: IconButton(
                          
                           icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,// chon icon cho bieu tuong mat
                        ),
                        onPressed: (){
                            setState((){
                              _obscureText = ! _obscureText;// dao nguoc lai gia tri de hien thi mk len man hinh
                            });
                          },
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),// chỉnh chiều dài chiều rộng của textField

                      ),
                    ),
                    SizedBox(height: 10,),
                    // ghi nhớ đăng nhập
                    Row(
                      children: [
                        Checkbox(
                          value: _ghinho,// gía trị hiện tại của checkbox được liên kết với ghi nhớ
                         onChanged: (value){
                          setState(() {
                            _ghinho= value!;// khi người dùng ấn sẽ là true khi ng dùng bỏ tick sẽ là false, ! để đảm bảo giá trị được gán kiểu bool
                          });
                         },
                          ),
                          Text("Nhớ mật khẩu",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ElevatedButton(
                    onPressed:(){}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      
                   minimumSize: Size(double.infinity,50),
                    ),
                   child: Text(
                    "Đăng nhập",
                    style: TextStyle(
                      fontSize: 20,
                      color:  Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                   ),
                   ),
                   ElevatedButton(onPressed: (){},
                   style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),// bo viền của box
                    ),
                    minimumSize: Size(double.infinity, 50),
                   ),
                    child: Text(
                      "Quên mật khẩu?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                        fontSize:  20,
                      ),
                    ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 1,
                      color: Colors.black,
                      margin: EdgeInsets.symmetric(vertical: 10),// tạo dấu gạch ngang
                    ),
                    SizedBox(height: 20,),
                    // khi ấn vào đăng ký tài khoản thì hiện giao diện đăng ký
                    ElevatedButton(onPressed: (){
                      // Navigator.push(context,
                      //  MaterialPageRoute(builder: (context) => DangKy()),
                      //  );
                    },
                    style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                     child: Text(
                      "Đăng ký tài khoản mới",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                     )
                     ),
                  ],
                ),
              ),
              ),
              ],
            ),
           ),
        ),
      ),
        ],
    ),
    
    );
  }
}