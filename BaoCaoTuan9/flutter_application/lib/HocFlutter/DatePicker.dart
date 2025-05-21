import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

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
  final _dOBController = TextEditingController();
  String? _selectedCity;
  bool _obscurePassword = true;
  String? _gioiTinh;
  bool _checkBox = false;
  DateTime? _dOB;

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
            FormField<String>(
  validator: (value) {
    if (value == null || value.isEmpty) {
      return "Vui lòng chọn giới tính";
    }
    return null;
  },
  initialValue: _gioiTinh,
  builder: (FormFieldState<String> state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Giới tính"),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: Text("Nam"),
                value: "nam",
                groupValue: _gioiTinh,
                onChanged: (value) {
                  setState(() {
                    _gioiTinh = value;
                    state.didChange(value);
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text("Nữ"),
                value: "nu",
                groupValue: _gioiTinh,
                onChanged: (value) {
                  setState(() {
                    _gioiTinh = value;
                    state.didChange(value);
                  });
                },
              ),
            ),
          ],
        ),
        if (state.hasError)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 4.0),
            child: Text(
              state.errorText ?? '',
              style: TextStyle(color: Colors.red),
            ),
          )
      ],
    );
  },
),
            SizedBox(height: 20,),
            TextFormField(
              controller: _dOBController,
              decoration: InputDecoration(
                labelText: "Ngày sinh",
                hintText: "Chọn ngày sinh của bạn",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: ()async{
                DateTime? pickedDate = await showDatePicker(
                  context: context, 
                  firstDate: DateTime(1980), 
                  lastDate: DateTime.now(),
                  
                 );
                  if(pickedDate!=null)
                  {
                   String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                   setState(() {
                     _dOBController.text = formattedDate;
                    _dOB = pickedDate;
                   });
                  }
                 
              },
              validator: (value) {
                if(value==null||value.isEmpty) {
                  return "Vui lòng chọn ngày sinh của bạn!";
                }
                return null;
              },
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

             SizedBox(height: 20,),
              CheckboxListTile(
                title: Text("Bạn đồng ý với điều khoản sử dụng."),
                value: _checkBox, 
              onChanged: (value){
                setState(() {
                  _checkBox=value!;
                  print("Đồng ý: $_checkBox");
                });
              },
              controlAffinity: ListTileControlAffinity.leading,// hiển thị nút tích bên tay trái
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
                  "Submit",

                )
                ),
                SizedBox(width: 20),

                ElevatedButton(onPressed: (){
                  _formKey.currentState!.reset();
                  setState(() {
                    _name= null;
                    _checkBox =false;
                    _gioiTinh = null;
                    _dOBController.text = "";
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
