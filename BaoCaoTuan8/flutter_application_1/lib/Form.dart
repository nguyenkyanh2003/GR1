import 'package:flutter/material.dart';

void main()
{
    runApp(MaterialApp(
        home:  SafeArea(
            child: FormDemo(),
            ),
              debugShowCheckedModeBanner: false,
        )
    );
}
class FormDemo extends StatefulWidget {
  const FormDemo({super.key});

  @override
  State<StatefulWidget> createState() => _FormDemo();

}
class _FormDemo extends State<FormDemo>{
  // sử dụng Global key để tru cập form
  final _formKey = GlobalKey<FormState>();
  String? _name;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
    appBar: AppBar(
      title: Text("Form cơ bản"),
    ),
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(// form chứa và quản lý trường nhập dữ liệu của người dùng và gửi thông tin đi
       //key: được sử dụng để truy cập vào trạng thái của form
       // Phương thức validate() gọi hàm onSaved của mỗi trường
       // Phương thức reset() đặt lại giá trị của tất cả các trường
        key:  _formKey,
         child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Họ và tên",
                hintText: "Nhập họ và tên của bạn",
                border: OutlineInputBorder(

                ),
              ),
              onSaved: (value){
                _name = value;// lưu phần ng dùng nhập
              },
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                    // dấu chấm than phía sau là chắc chắn sẽ có, validate đã nhập đúng hay chưa
                  _formKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                    content: Text("Xin chào $_name"),
                    duration: Duration(seconds: 3),
                    backgroundColor: Colors.green,
                    )
                  );
                  }
                }, 
                child: Text(
                  "Summit",

                )
                ),
                SizedBox(width: 20),

                ElevatedButton(onPressed: (){
                  _formKey.currentState!.reset();
                  setState(() {
                    _name= null;
                  });
                }, 
                child: Text("Reset")),
              ],
            ),
          ],
         )
        ),
    ),
   );
  }

}
