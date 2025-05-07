
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main()
{
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
           leading: IconButton(onPressed: (){}, 
           icon: Icon(
            Icons.arrow_back,
            size: 24,
           )
           ),
           actions: [
            IconButton(onPressed: (){}, 
            icon: Icon(
              Icons.refresh,
              size: 24,
            ),
            ),
           ],
          ),
          body: DangKy(),
        )
      ),
      debugShowCheckedModeBanner: false,
    )
  );
}
class DangKy extends StatefulWidget{
  const DangKy({super.key});

  @override
  State<StatefulWidget> createState() => DangKy1();
    // TODO: implement createState
    

}
class DangKy1 extends State<DangKy>{
  bool _matKhau = true;
  bool _xacNhan = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,// chia tỉ lệ 1:1
            child: Container(
              color: Colors.grey[400],
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(// chế độ xem cuộn được màn hình+
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                             WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.account_circle,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                              )
                            ),
                            
                            const TextSpan(text: "Đăng Ký",)
                           
                          ]

                        ),
                      ),
                      SizedBox(height: 10,),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              // điền thông tin tài khoản
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon:const Icon(
                                    Icons.account_circle,
                                    color: Colors.black,
                                  ),
                                  labelText: "Điền email hoặc SĐT đăng ký",
                                  labelStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  
                                  
                                ),

                              ),
                              // nhập Mật khẩu
                            TextField(
                               obscureText: _matKhau,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                labelText: "Nhập mật khẩu của bạn",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                suffix:  IconButton(
                                  icon: Icon(
                                    _matKhau ? Icons.visibility_off : Icons.visibility,
                                  ), 
                                  onPressed: () { 
                                    setState((){
                                      _matKhau = !_matKhau;
                                    }
                                    );
                                   },
                                ),
                             

                              ),
                              
                               
                            ),
                            TextField(
                              obscureText: _xacNhan,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outlined,
                                  color: Colors.black,
                                ),
                                labelText: "Xác nhận mật khẩu",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                suffix: IconButton(
                                  onPressed:(){
                                    setState(() {
                                      _xacNhan = ! _xacNhan;
                                    });
                                  }, 
                                  icon: Icon(
                                    _xacNhan ? Icons.visibility_off  : Icons.visibility,
                                  ),
                                  ),
                              ),
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
          ),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image:DecorationImage(
          //       image: AssetImage('images/TAN-GIA-BANG-BACKGROUND-QUAN-CAFE-03.jpg-1024x580.jpg'),
          //     fit: BoxFit.cover,
          //       ),
          //     ),
          //   ) 
          // )
        ],
      ),
    );
      
  }
  
}


