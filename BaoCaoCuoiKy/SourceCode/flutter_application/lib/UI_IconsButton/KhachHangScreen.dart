import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Dùng để format ngày

void main() {
  runApp(MyApp());
}

/// Entry point của ứng dụng
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý khách hàng',
      theme: ThemeData(
        primaryColor: Colors.blue[700],
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: KhachHangScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Màn hình quản lý khách hàng
class KhachHangScreen extends StatefulWidget {
  const KhachHangScreen({super.key});

  @override
  _KhachHangScreen createState() => _KhachHangScreen();
}

class _KhachHangScreen extends State<KhachHangScreen> {
  // Danh sách mẫu khách hàng
  final List<Map<String, dynamic>> _customers = [
    {
      'id': 1,
      'code': 'KH001',
      'name': 'Phạm Thị X',
      'phone': '0901111111',
      'email': 'pham.tx@example.com',
      'tier': 'Bạc',
      'points': 120,
      'visits': 5,
      'totalSpent': 1500000,
      'regDate': '01/01/2024',
    },
    {
      'id': 2,
      'code': 'KH002',
      'name': 'Trương Văn Y',
      'phone': '0912222222',
      'email': 'truong.vy@example.com',
      'tier': 'Vàng',
      'points': 450,
      'visits': 12,
      'totalSpent': 3200000,
      'regDate': '15/02/2024',
    },
    {
      'id': 3,
      'code': 'KH003',
      'name': 'Lê Thị Z',
      'phone': '0923333333',
      'email': 'le.tz@example.com',
      'tier': 'Kim Cương',
      'points': 980,
      'visits': 20,
      'totalSpent': 7600000,
      'regDate': '10/03/2024',
    },
  ];

  // Danh sách đã lọc (tìm kiếm)
  List<Map<String, dynamic>> _filteredCustomers = [];

  // Controller tìm kiếm
  final TextEditingController _searchController = TextEditingController();

  // Lấy chuỗi ngày hiện tại để lưu ngày đăng ký
  String get _todayString {
    final now = DateTime.now();
    return DateFormat('dd/MM/yyyy').format(now);
  }

  @override
  void initState() {
    super.initState();
    // Ban đầu, danh sách lọc = danh sách gốc
    _filteredCustomers = List.from(_customers);
    // Thêm listener để mỗi khi nhập tìm kiếm thì lọc lại
    _searchController.addListener(_filterCustomerList);
  }

  /// Hàm lọc danh sách theo tên, mã, SĐT hoặc email
  void _filterCustomerList() {
    final query = _searchController.text.toLowerCase().trim();
    setState(() {
      _filteredCustomers = _customers.where((cust) {
        final nameLower = cust['name'].toLowerCase();
        final codeLower = cust['code'].toLowerCase();
        final phoneLower = (cust['phone'] as String).toLowerCase();
        final emailLower = (cust['email'] as String).toLowerCase();
        return nameLower.contains(query) ||
            codeLower.contains(query) ||
            phoneLower.contains(query) ||
            emailLower.contains(query);
      }).toList();
    });
  }

  /// Xóa khách hàng tại vị trí index trong danh sách gốc
  void _removeCustomer(int index) {
    setState(() {
      _customers.removeAt(index);
      _filterCustomerList(); // Cập nhật lại danh sách lọc
    });
  }

  /// Hiển thị dialog để thêm khách hàng mới
  void _showAddCustomerDialog() {
    String code = '';
    String name = '';
    String phone = '';
    String email = '';
    String tier = 'Bạc';
    int points = 0;
    int visits = 0;
    double totalSpent = 0.0;
    DateTime regDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) =>
          StatefulBuilder(builder: (context, setDialogState) {
        return AlertDialog(
          title: Text('Thêm khách hàng mới'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Mã khách hàng
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Mã KH',
                    hintText: 'Ví dụ: KH004',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => code = value.trim(),
                ),
                SizedBox(height: 12),

                // Tên khách hàng
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Tên KH',
                    hintText: 'Nhập tên khách hàng',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => name = value.trim(),
                ),
                SizedBox(height: 12),

                // Số điện thoại
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Số điện thoại',
                    hintText: 'Nhập số điện thoại',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => phone = value.trim(),
                ),
                SizedBox(height: 12),

                // Email
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Nhập email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => email = value.trim(),
                ),
                SizedBox(height: 12),

                // Hạng khách hàng (Dropdown)
                DropdownButtonFormField<String>(
                  value: tier,
                  decoration: InputDecoration(
                    labelText: 'Hạng',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Bạc', 'Vàng', 'Kim Cương']
                      .map((t) => DropdownMenuItem(
                            value: t,
                            child: Text(t),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setDialogState(() => tier = value);
                    }
                  },
                ),
                SizedBox(height: 12),

                // Điểm thưởng (mặc định 0)
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Điểm thưởng',
                    hintText: 'Số điểm hiện có',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      points = int.tryParse(value.trim()) ?? 0,
                ),
                SizedBox(height: 12),

                // Số lần đã ghé (mặc định 0)
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Số lần ghé quán',
                    hintText: 'Ví dụ: 3',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      visits = int.tryParse(value.trim()) ?? 0,
                ),
                SizedBox(height: 12),

                // Tổng chi tiêu (mặc định 0)
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Tổng chi tiêu (đồng)',
                    hintText: 'Ví dụ: 1500000',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      totalSpent = double.tryParse(value.trim()) ?? 0.0,
                ),
                SizedBox(height: 12),

                // Ngày đăng ký
                Row(
                  children: [
                    Text(
                      'Ngày ĐK: ${regDate.day.toString().padLeft(2, '0')}/'
                      '${regDate.month.toString().padLeft(2, '0')}/'
                      '${regDate.year}',
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: regDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setDialogState(() => regDate = picked);
                        }
                      },
                      child: Text('Chọn ngày'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            // Nút Hủy
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Hủy',
                style: TextStyle(color: Colors.red),
              ),
            ),
            // Nút Lưu
            TextButton(
              onPressed: () {
                if (code.isNotEmpty &&
                    name.isNotEmpty &&
                    phone.isNotEmpty &&
                    email.isNotEmpty) {
                  setState(() {
                    _customers.add({
                      'id': _customers.length + 1,
                      'code': code,
                      'name': name,
                      'phone': phone,
                      'email': email,
                      'tier': tier,
                      'points': points,
                      'visits': visits,
                      'totalSpent': totalSpent.toInt(),
                      'regDate': DateFormat('dd/MM/yyyy').format(regDate),
                    });
                    _filterCustomerList();
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đã thêm khách hàng $name')),
                  );
                }
              },
              child: Text('Lưu'),
            ),
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // Icon “Quay lại” về trang trước
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Quản lý khách hàng',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[700],
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Có thể show/hide TextField tìm kiếm trong AppBar nếu muốn
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Thanh tìm kiếm khách hàng
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Tìm khách hàng',
                hintText: 'Nhập tên, mã, SĐT hoặc email',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Bảng danh sách khách hàng
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 12,
                  headingRowColor:
                      WidgetStateProperty.all(Colors.blue[50]),
                  columns: [
                    DataColumn(label: Text('STT')),
                    DataColumn(label: Text('Mã KH')),
                    DataColumn(label: Text('Tên KH')),
                    DataColumn(label: Text('SĐT')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Hạng')),
                    DataColumn(label: Text('Điểm')),
                    DataColumn(label: Text('Lần ghé')),
                    DataColumn(label: Text('Tổng chi')),
                    DataColumn(label: Text('Ngày ĐK')),
                    DataColumn(label: Text('Hành động')),
                  ],
                  rows: _filteredCustomers.map((cust) {
                    final originalIndex = _customers.indexOf(cust);
                    return DataRow(cells: [
                      DataCell(Text(cust['id'].toString())),
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 80),
                          child: Text(
                            cust['code'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 120),
                          child: Text(
                            cust['name'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 100),
                          child: Text(
                            cust['phone'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 140),
                          child: Text(
                            cust['email'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(Text(cust['tier'])),
                      DataCell(Text(cust['points'].toString())),
                      DataCell(Text(cust['visits'].toString())),
                      DataCell(Text('${cust['totalSpent']} đ')),
                      DataCell(Text(cust['regDate'])),
                      DataCell(
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _removeCustomer(originalIndex);
                          },
                          tooltip: 'Xóa khách hàng',
                        ),
                      ),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),

      // Nút thêm khách hàng mới
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCustomerDialog,
        backgroundColor: Colors.green[700],
        tooltip: 'Thêm khách hàng',
        child: Icon(Icons.person_add),
      ),

      // Thanh bottom navigation (giống các màn hình khác)
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Tổng Quan"),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2), label: "Kho"),
          BottomNavigationBarItem(
              icon: Icon(Icons.upload), label: "Nhập hàng"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Nhân viên'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: 'Khách hàng'),
        ],
        currentIndex: 4, // index của mục "Khách hàng"
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          // Xử lý chuyển page nếu cần
        },
      ),
    );
  }
}
