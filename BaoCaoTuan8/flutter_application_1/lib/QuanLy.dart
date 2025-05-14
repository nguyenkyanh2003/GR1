import 'package:flutter/material.dart';

// Điểm khởi đầu của ứng dụng
void main() {
  runApp(
    MaterialApp(
      home: QuanLy(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// Widget chính của màn hình, sử dụng StatefulWidget để quản lý trạng thái (dropdown)
class QuanLy extends StatefulWidget {
  const QuanLy({super.key});

  @override
  State<QuanLy> createState() => _QuanLyState();
}

// Trạng thái của QuanLy, quản lý giá trị của dropdown
class _QuanLyState extends State<QuanLy> {
  String _selectedValue = 'Hôm nay'; // Giá trị mặc định cho dropdown thời gian
  String _chiNhanh = 'Tất cả các chi nhánh'; // Giá trị mặc định cho dropdown chi nhánh
  final List<String> _ngay = ['Hôm nay', 'Hôm qua', 'Tuần này']; // Danh sách thời gian
  final List<String> _allChiNhanh = ['Tất cả các chi nhánh', 'Chi nhánh Hà Nội', 'Chi nhánh HCM']; // Danh sách chi nhánh

  // Hàm xây dựng AppBar riêng biệt
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          'assets/images/Logo.jpg', // Đường dẫn tới logo
          width: 100,
          height: 100,
        ),
      ),
      title: const Text(
        "GoodFood",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.help)),
      ],
      backgroundColor: Colors.transparent, // AppBar trong suốt để lộ gradient
      elevation: 0, // Xóa bóng của AppBar
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4FC3F7), // Gradient màu xanh nhạt
              Color(0xFFB2EBF2),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // Tăng chiều cao để hiển thị đầy đủ dropdown
        child: Container(
          color: Colors.transparent, // Đảm bảo phần bottom không bị che bởi gradient
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn đều hai dropdown
            children: [
              DropdownButton(
                value: _selectedValue,
                items: _ngay
                    .map(
                      (String value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedValue = value;
                    });
                  }
                },
                dropdownColor: Colors.white,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                underline: Container(
                  height: 1,
                  color: Colors.grey,
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
              DropdownButton(
                value: _chiNhanh,
                items: _allChiNhanh
                    .map((String value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _chiNhanh = value;
                    });
                  }
                },
                dropdownColor: Colors.white,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                underline: Container(
                  height: 1,
                  color: Colors.grey,
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Cho phép gradient kéo dài ra sau AppBar
      appBar: _buildAppBar(), // Sử dụng AppBar đã tách riêng
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4FC3F7), // Gradient màu xanh nhạt
              Color(0xFFB2EBF2),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 10.0), // Tăng padding top để tránh bị đè bởi AppBar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.white.withOpacity(0.9), // Màu nền trắng với độ trong
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Bo góc 10px
                  ),
                  elevation: 4, // Độ cao của card
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Sắp xếp thông tin cột theo chiều ngang
                          children: [
                            Column( // Cột bên trái: Hóa đơn
                              children: const [
                                Text(
                                  '0 hóa đơn',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '0 đơn đang phục vụ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Column( // Cột bên phải: Bàn
                              children: const [
                                Text(
                                  '0 bàn đang sử dụng',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '0/1 khách đang phục vụ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildIconButton(Icons.account_balance_wallet, Colors.blue, 'Vay vốn'),
                            _buildIconButton(Icons.inventory, Colors.green, 'Kiểm kho'),
                            _buildIconButton(Icons.download, Colors.blue, 'Nhập hàng'),
                            _buildIconButton(Icons.person, Colors.green, 'Nhân viên'),
                            _buildIconButton(Icons.group, Colors.blue, 'Khách hàng'),// tạo ra các icon nhãn dansng dùng được trong nhiều dash
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height:10,),
                Container(
                  height: 100,// chiều cao của banner
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF1976D2), // Màu xanh đậm bên trái
                        Color(0xFF42A5F5), // Màu xanh nhạt bên phải
                      ]
                    ),
                    boxShadow: const [
                      BoxShadow(// hiệu ứng bóng cho banner
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0,4),
                      )
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Hướng dẫn \nXuât hóa đơn điện tử từ máy tính tiền",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                // Doanh thu
                Card(
                  color: Colors.white.withOpacity(0.9),// trắng trong xuốt
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,// thứ tự con được căn chỉnh
                      children: [
                        const Text('Doanh thu',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton( onPressed:(){},child: Text('Giờ', style: TextStyle(color: Colors.blue))),
                            TextButton(onPressed:(){},child:  Text('Ngày', style: TextStyle(color: Colors.black))),
                            TextButton(onPressed:(){},child:  Text('Thứ', style: TextStyle(color: Colors.black))),
                          ],
                        ),
                        const SizedBox(height: 100,),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Chưa có dữ liệu',
                              style:TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                                
                              ),
                           
                              ),
                              Text("Doanh thu cửa hàng của bạn sẽ hiển thị tại đây",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 100,),
                      ],
                    )
                  ),
                ),
                const SizedBox(height: 10,),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "Tổng Quan"),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood),label: "Hàng hóa"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Hóa đơn'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Sổ quỹ'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Nhiều hơn'),
        ],
        currentIndex: 0,// chỉ mục tab đang được chọn tổng quan là 0
        selectedItemColor: Colors.blue,// màu của tab được chọn
        unselectedItemColor: Colors.grey,// màu của tab ko được chọn
        onTap: (value) {
          
        },
      ),
      
    );
  }
  Widget _buildIconButton(IconData icon, Color color, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: color),
          onPressed: () {},
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ],
    );
  
   
  }
}

Widget _buildIconButton(IconData icon, Color color, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: color),
          onPressed: () {},
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
