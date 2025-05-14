import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// void main()
// {
//   runApp(MaterialApp(
//     home: DangKy(),
//     debugShowCheckedModeBanner: false,
//   ));
// }
class DangKy extends StatefulWidget {
  const DangKy({super.key});

  @override
  State<StatefulWidget> createState() => DangKy1();
  // TODO: implement createState
}

class DangKy1 extends State<DangKy> {
  bool _matKhau = true;
  bool _xacNhan = true;
  DateTime? _selectedDate;
  final _formKey = GlobalKey<FormState>();
  final _accountController = TextEditingController(); // dùng để xử lý sự kiện cho từng textForm
  final _passwordController = TextEditingController();
  final _confimpassController = TextEditingController();
  final _dobController = TextEditingController();
  final List<String> _city = [
    "Hà Nội",
    "Hải Phòng",
    "Vĩnh Phúc",
    "Hải Dương",
    "Hà Nam",
    "Hồ Chí Minh",
    "Huế",
    "Cần Thơ",
    "Bình Dương"
  ];

  @override
  void dispose() {
    // dob
    _dobController.dispose(); // tránh rò rỉ bộ nhớ
    _accountController.dispose();
    _passwordController.dispose();
    _confimpassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/DangNhap'); // Thay thế màn hình hiện tại bằng DangNhap
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.refresh,
              size: 24,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1, // chia tỉ lệ 1:1
            child: Container(
              color: Colors.grey[400],
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: SingleChildScrollView(
                  // chế độ xem cuộn được màn hình+
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
                              ),
                            ),
                            const TextSpan(
                              text: "Đăng Ký",
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                // điền thông tin tài khoản
                                TextFormField(
                                  controller: _accountController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.account_circle,
                                      color: Colors.black,
                                    ),
                                    labelText: "Email hoặc SĐT.",
                                    hintText: "Điền email hoặc SĐT của bạn.",
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                    ),
                                    contentPadding: EdgeInsets.all(12.0),
                                    filled: true,
                                    fillColor: Colors.white,
                                    isDense: true,
                                  ),
                                  validator: (value) {
                                    // Biểu thức kiểm tra email
                                    final emailRegExp =
                                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                    // Biểu thức kiểm tra số điện thoại (Việt Nam: 10 chữ số, bắt đầu bằng 0)
                                    final phoneRegExp = RegExp(r'^0\d{9}$');
                                    if (value == null || value.isEmpty) {
                                      return "Vui lòng điền thông tin đăng nhập của bạn.";
                                    }
                                    if (!emailRegExp.hasMatch(value) &&
                                        !phoneRegExp.hasMatch(value)) {
                                      return "Email hoặc số điện thoại bạn nhập không hợp lệ.";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 10),
                                // nhập Mật khẩu
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: _matKhau,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                    labelText: "Nhập mật khẩu của bạn.",
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    suffix: IconButton(
                                      icon: Icon(
                                        _matKhau
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _matKhau = !_matKhau;
                                        });
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                    ),
                                    contentPadding: EdgeInsets.all(12.0),
                                    filled: true,
                                    fillColor: Colors.white,
                                    isDense: true,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Vui lòng nhập mật khẩu của bạn.";
                                    }
                                    if (value.length < 8) {
                                      return "Mật khẩu tối thiểu 8 kí tự.";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  controller: _confimpassController,
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
                                      onPressed: () {
                                        setState(() {
                                          _xacNhan = !_xacNhan;
                                        });
                                      },
                                      icon: Icon(
                                        _xacNhan
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                    ),
                                    contentPadding: EdgeInsets.all(12.0),
                                    filled: true,
                                    fillColor: Colors.white,
                                    isDense: true,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Vui lòng xác nhận mật khẩu của bạn.";
                                    }
                                    if (value != _passwordController.text) {
                                      return "Mật khẩu không khớp.";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  controller: _dobController,
                                  readOnly: true, // không cho phép ng dùng nhập từ bàn phím
                                  decoration: InputDecoration(
                                    labelText: "Chọn ngày sinh của bạn",
                                    prefixIcon: Icon(
                                      Icons.calendar_today,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                    ),
                                    contentPadding: EdgeInsets.all(12.0),
                                    filled: true,
                                    fillColor: Colors.white,
                                    isDense: true,
                                  ),
                                  onTap: () async {
                                    FocusScope.of(context).unfocus(); // ẩn bàn phím nếu đang hiện
                                    final DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime(2000), // ngày mặc định ban đầu
                                      firstDate: DateTime(1900), // ngày bắt đầu
                                      lastDate: DateTime.now(), // ngày hôm nay
                                      locale: const Locale('vi', 'VN'), // lịch tiếng việt
                                    );
                                    if (pickedDate != null) {
                                      setState(() {
                                        _selectedDate = pickedDate;
                                        _dobController.text =
                                            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                      });
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Vui lòng chọn ngày sinh.";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 10),
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: "Thành Phố",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                    ),
                                    contentPadding: EdgeInsets.all(12.0),
                                    filled: true,
                                    fillColor: Colors.white,
                                    isDense: true,
                                  ),
                                  items: _city.map((city) {
                                    return DropdownMenuItem<String>(
                                      value: city,
                                      child: Text(city),
                                    );
                                  }).toList(),
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ?? false) {
                                      // trả về true nếu tất cả Form hợp lệ tránh văng khỏi màn hình khi không hợp lệ
                                      _formKey.currentState!.save();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("Bạn đã đăng kí thành công"),
                                          duration: Duration(seconds: 3),
                                          backgroundColor: Colors.blue,
                                        ),
                                      );
                                      // Navigator.pushReplacementNamed(context, '/DangNhap'); // Thay thế màn hình hiện tại bằng DangNhap
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    "Đăng ký tài khoản",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Bạn không muốn đăng ký tài khoản?",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(context, '/DangNhap'); // Thay thế màn hình hiện tại bằng DangNhap
                                      },
                                      child: Text(
                                        "Đăng nhập",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}