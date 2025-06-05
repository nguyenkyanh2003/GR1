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
  final List<String> _ngay = ['Hôm nay', 'Hôm qua', '7 ngày gần đây', 'Tháng này', 'Tháng trước', 'Tùy chỉnh']; // Danh sách thời gian

  // Dữ liệu giả lập sẽ thay đổi theo ngày được chọn
  Map<String, dynamic> _data = {
    'orders': '0 hóa đơn',
    'servingOrders': '0 đơn đang phục vụ',
    'tables': '0 bàn đang sử dụng',
    'guests': '0 khách đang phục vụ',
    'inventoryTotal': '0',
    'inventoryQuantity': '0',
    'cancelItems': [
      {'title': 'Hủy món sau khi báo bếp', 'percentage': '0% doanh thu', 'quantity': '0 món', 'revenue': '0'},
      {'title': 'Hủy món sau khi đã in hóa đơn', 'percentage': '0% doanh thu', 'quantity': '0 món', 'revenue': '0'},
      {'title': 'Hủy món sau khi giao hàng', 'percentage': '0% doanh thu', 'quantity': '0 món', 'revenue': '0'},
    ],
  };

  @override
  void initState() {
    super.initState();
    _updateData(); // Khởi tạo dữ liệu ban đầu
  }

  // Hàm cập nhật dữ liệu dựa trên ngày được chọn
  void _updateData() {
    setState(() {
      switch (_selectedValue) {
        case 'Hôm nay':
          _data = {
            'orders': '0 hóa đơn',
            'servingOrders': '0 đơn đang phục vụ',
            'tables': '0 bàn đang sử dụng',
            'guests': '0 khách đang phục vụ',
            'inventoryTotal': '0',
            'inventoryQuantity': '0',
            'cancelItems': [
              {'title': 'Hủy món sau khi báo bếp', 'percentage': '0% doanh thu', 'quantity': '0 món', 'revenue': '0'},
              {'title': 'Hủy món sau khi đã in hóa đơn', 'percentage': '0% doanh thu', 'quantity': '0 món', 'revenue': '0'},
              {'title': 'Hủy món sau khi giao hàng', 'percentage': '0% doanh thu', 'quantity': '0 món', 'revenue': '0'},
            ],
          };
          break;
        case 'Hôm qua':
          _data = {
            'orders': '5 hóa đơn',
            'servingOrders': '2 đơn đang phục vụ',
            'tables': '3 bàn đang sử dụng',
            'guests': '5 khách đang phục vụ',
            'inventoryTotal': '1,200,000',
            'inventoryQuantity': '50',
            'cancelItems': [
              {'title': 'Hủy món sau khi báo bếp', 'percentage': '5% doanh thu', 'quantity': '2 món', 'revenue': '50,000'},
              {'title': 'Hủy món sau khi đã in hóa đơn', 'percentage': '2% doanh thu', 'quantity': '1 món', 'revenue': '20,000'},
              {'title': 'Hủy món sau khi giao hàng', 'percentage': '0% doanh thu', 'quantity': '0 món', 'revenue': '0'},
            ],
          };
          break;
        case '7 ngày gần đây':
          _data = {
            'orders': '20 hóa đơn',
            'servingOrders': '8 đơn đang phục vụ',
            'tables': '10 bàn đang sử dụng',
            'guests': '15 khách đang phục vụ',
            'inventoryTotal': '5,000,000',
            'inventoryQuantity': '200',
            'cancelItems': [
              {'title': 'Hủy món sau khi báo bếp', 'percentage': '8% doanh thu', 'quantity': '5 món', 'revenue': '150,000'},
              {'title': 'Hủy món sau khi đã in hóa đơn', 'percentage': '3% doanh thu', 'quantity': '3 món', 'revenue': '90,000'},
              {'title': 'Hủy món sau khi giao hàng', 'percentage': '1% doanh thu', 'quantity': '1 món', 'revenue': '10,000'},
            ],
          };
          break;
        case 'Tháng này':
          _data = {
            'orders': '50 hóa đơn',
            'servingOrders': '15 đơn đang phục vụ',
            'tables': '20 bàn đang sử dụng',
            'guests': '30 khách đang phục vụ',
            'inventoryTotal': '10,000,000',
            'inventoryQuantity': '500',
            'cancelItems': [
              {'title': 'Hủy món sau khi báo bếp', 'percentage': '10% doanh thu', 'quantity': '10 món', 'revenue': '300,000'},
              {'title': 'Hủy món sau khi đã in hóa đơn', 'percentage': '5% doanh thu', 'quantity': '5 món', 'revenue': '150,000'},
              {'title': 'Hủy món sau khi giao hàng', 'percentage': '2% doanh thu', 'quantity': '2 món', 'revenue': '20,000'},
            ],
          };
          break;
        case 'Tháng trước':
          _data = {
            'orders': '40 hóa đơn',
            'servingOrders': '10 đơn đang phục vụ',
            'tables': '15 bàn đang sử dụng',
            'guests': '25 khách đang phục vụ',
            'inventoryTotal': '8,000,000',
            'inventoryQuantity': '400',
            'cancelItems': [
              {'title': 'Hủy món sau khi báo bếp', 'percentage': '7% doanh thu', 'quantity': '7 món', 'revenue': '200,000'},
              {'title': 'Hủy món sau khi đã in hóa đơn', 'percentage': '4% doanh thu', 'quantity': '4 món', 'revenue': '100,000'},
              {'title': 'Hủy món sau khi giao hàng', 'percentage': '1% doanh thu', 'quantity': '1 món', 'revenue': '10,000'},
            ],
          };
          break;
      }
    });
  }

  // Hàm xây dựng AppBar riêng biệt
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          'assets/images/Logo.jpg',
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
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4FC3F7),
              Color(0xFFB2EBF2),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      _updateData(); // Cập nhật dữ liệu khi ngày thay đổi
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
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4FC3F7),
              Color(0xFFB2EBF2),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Card(
                  color: Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  _data['orders'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _data['servingOrders'],
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  _data['tables'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _data['guests'],
                                  style: const TextStyle(color: Colors.grey),
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
                            _buildIconButton(Icons.group, Colors.blue, 'Khách hàng'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Doanh thu
                Card(
                  color: Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Doanh thu',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('Giờ', style: TextStyle(color: Colors.blue)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Ngày', style: TextStyle(color: Colors.black)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Thứ', style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 150),
                        const Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Chưa có dữ liệu',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Doanh thu cửa hàng của bạn sẽ hiển thị tại đây",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 150),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Hàng tồn kho
                Card(
                  color: Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tồn kho",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Tổng tiền hàng",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _data['inventoryTotal'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 255, 64, 134),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Số lượng hàng",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _data['inventoryQuantity'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 7, 106),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Hàng bán chạy
                Card(
                  color: Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hàng bán chạy",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                "Theo doanh thu",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "Theo số lượng",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 150),
                        const Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Chưa có dữ liệu",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "Top hàng bán chạy sẽ được hiển thị tại đây",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 150),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Hủy món
                Card(
                  color: Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hủy món",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        ..._data['cancelItems'].asMap().entries.map((entry) {
                          int index = entry.key;
                          Map<String, String> item = entry.value;
                          return Column(
                            children: [
                              _huyMon(
                                item['title']!,
                                item['percentage']!,
                                item['quantity']!,
                                item['revenue']!,
                              ),
                              if (index < _data['cancelItems'].length - 1) const Divider(),
                            ],
                          );
                        }).toList(),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Tổng Quan"),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: "Hàng hóa"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Hóa đơn'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Sổ quỹ'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Nhiều hơn'),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (value) {},
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

  Widget _huyMon(String title, String percentage, String quantity, String revenue) {
    return InkWell(
      focusColor: Colors.blueGrey,
      highlightColor: Colors.blue,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(171, 0, 0, 0),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            percentage,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(171, 0, 0, 0),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chevron_right,
                              color: Color.fromARGB(171, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        quantity,
                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text(
                        revenue,
                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}