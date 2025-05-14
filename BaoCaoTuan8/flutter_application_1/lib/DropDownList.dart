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
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final List<String> _cities = ['Hà Nội','Hồ Chí Minh','Đà nẵng','Cần Thơ','Huế'];
  
  String? _selectedCity;
  bool _obscurePassword = true;

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
            // TexrFormField là phiên bản mở rộng của textField
            // Validator là hàm kiểm tra tính hợp lệ của dữ liệu
            // Controller cho phép truy cập và điều khiển giá trị
            // obscureText cho phép ẩn văn bản
            // AutovalidateMode điều khiển thời điểm validation được kích hoạt
            TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(
                labelText: "Họ và tên",
                hintText: "Nhập họ và tên của bạn",
                border: OutlineInputBorder(

                ),
              ),
              onSaved: (value){
                _name = value;// lưu phần ng dùng nhập
              },
              validator:(value){
                if(value==null||value.isEmpty){
                  return "Vui lòng nhập họ và tên";
                }
                return null;
              } ,
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "exmple@gmail.com",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator:(value)
              {
                if(value ==null || value.isEmpty)
                {
                  return "Vui lòng nhập Email";
                }
                if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                  return 'Email không hợp lệ';
                }
                return null;
              }
            ),
            SizedBox(height: 20,),

            // só điện thoại.
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "Số điện thoại",
                hintText: "Vui lòng nhập số điện thoại",
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if(value==null|| value.isEmpty) {
                  return "Vui lòng nhập số điện thoại của bạn";
                }
                if(!RegExp(r'^(0[3|5|7|8|9])[0-9]{8}$').hasMatch(value)) {
                  return "Số điện thoại không hợp nệ";
                }
                
                return null;
              },
            ),
         
            SizedBox(height: 20,),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Mật khẩu",
                hintText: "Nhập mật khẩu",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                      icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                 ) ,
                 
                  onPressed: (){
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
                },
                ),
             
              ),
              obscureText: _obscurePassword,
              validator: (value) {
                if(value==null|| value.isEmpty)
                {
                  return "Vui long nhap mat khau";
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: "Thành Phố",
                border: OutlineInputBorder(),
              ),
              items: _cities.map((city){
                return DropdownMenuItem(
                  value: city,
                  child:Text(city),
                   );
              }).toList(),
             onChanged: (Value){}
             ),

            SizedBox(height: 16.0,),
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
