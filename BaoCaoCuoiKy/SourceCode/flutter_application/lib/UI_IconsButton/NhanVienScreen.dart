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
      title: 'Quản lý nhân viên',
      theme: ThemeData(
        primaryColor: Colors.blue[700],
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: NhanVienScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Màn hình quản lý nhân viên
class NhanVienScreen extends StatefulWidget {
  const NhanVienScreen({super.key});

  @override
  _NhanVienScreen createState() => _NhanVienScreen();
}

class _NhanVienScreen extends State<NhanVienScreen> {
  // Danh sách mẫu nhân viên (kèm trường lastCheckIn để lưu ngày chấm công gần nhất)
  final List<Map<String, dynamic>> _employees = [
    {
      'id': 1,
      'code': 'NV001',
      'name': 'Nguyễn Văn A',
      'position': 'Quản lý',
      'phone': '0901234567',
      'joinDate': '01/03/2024',
      'lastCheckIn': '05/06/2025', // Giả lập đã chấm công hôm nay
    },
    {
      'id': 2,
      'code': 'NV002',
      'name': 'Trần Thị B',
      'position': 'Nhân viên phục vụ',
      'phone': '0912345678',
      'joinDate': '15/04/2024',
      'lastCheckIn': '04/06/2025', // Chưa chấm công hôm nay
    },
    {
      'id': 3,
      'code': 'NV003',
      'name': 'Lê Văn C',
      'position': 'Đầu bếp',
      'phone': '0923456789',
      'joinDate': '10/05/2024',
      'lastCheckIn': '05/06/2025', // Đã chấm công hôm nay
    },
  ];

  // Danh sách đã lọc (tìm kiếm)
  List<Map<String, dynamic>> _filteredEmployees = [];

  // Controller tìm kiếm
  final TextEditingController _searchController = TextEditingController();

  // Lấy chuỗi ngày hôm nay: "dd/MM/yyyy"
  String get _todayString {
    final now = DateTime.now();
    return DateFormat('dd/MM/yyyy').format(now);
  }

  @override
  void initState() {
    super.initState();
    // Ban đầu, danh sách lọc = danh sách gốc
    _filteredEmployees = List.from(_employees);
    // Thêm listener để mỗi khi nhập tìm kiếm thì lọc lại
    _searchController.addListener(_filterEmployeeList);
  }

  /// Hàm lọc danh sách theo tên hoặc mã
  void _filterEmployeeList() {
    final query = _searchController.text.toLowerCase().trim();
    setState(() {
      _filteredEmployees = _employees.where((emp) {
        final nameLower = emp['name'].toLowerCase();
        final codeLower = emp['code'].toLowerCase();
        return nameLower.contains(query) || codeLower.contains(query);
      }).toList();
    });
  }

  /// Xóa nhân viên tại vị trí index trong danh sách gốc
  void _removeEmployee(int index) {
    setState(() {
      _employees.removeAt(index);
      _filterEmployeeList(); // Cập nhật lại danh sách lọc
    });
  }

  /// “Chấm công” cho nhân viên: cập nhật lastCheckIn thành ngày hôm nay
  void _checkInEmployee(int index) {
    setState(() {
      _employees[index]['lastCheckIn'] = _todayString;
      _filterEmployeeList();
    });
  }

  /// Hiển thị dialog để thêm nhân viên mới
  void _showAddEmployeeDialog() {
    String code = '';
    String name = '';
    String position = '';
    String phone = '';
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) =>
          StatefulBuilder(builder: (context, setDialogState) {
        return AlertDialog(
          title: Text('Thêm nhân viên mới'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Mã nhân viên
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Mã NV',
                    hintText: 'Ví dụ: NV004',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => code = value.trim(),
                ),
                SizedBox(height: 12),

                // Tên nhân viên
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Tên NV',
                    hintText: 'Nhập tên nhân viên',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => name = value.trim(),
                ),
                SizedBox(height: 12),

                // Chức vụ
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Chức vụ',
                    hintText: 'Ví dụ: Thu ngân, Phục vụ, Đầu bếp',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => position = value.trim(),
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

                // Ngày vào làm
                Row(
                  children: [
                    Text(
                      'Ngày vào: ${selectedDate.day.toString().padLeft(2, '0')}/'
                      '${selectedDate.month.toString().padLeft(2, '0')}/'
                      '${selectedDate.year}',
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setDialogState(() => selectedDate = picked);
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
                    position.isNotEmpty &&
                    phone.isNotEmpty) {
                  setState(() {
                    _employees.add({
                      'id': _employees.length + 1,
                      'code': code,
                      'name': name,
                      'position': position,
                      'phone': phone,
                      'joinDate':
                          '${selectedDate.day.toString().padLeft(2, '0')}/'
                          '${selectedDate.month.toString().padLeft(2, '0')}/'
                          '${selectedDate.year}',
                      // Mặc định khi thêm là chưa chấm công hôm nay
                      'lastCheckIn': '',
                    });
                    _filterEmployeeList();
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đã thêm nhân viên $name')),
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
          // Icon “Quay lại” vào trang trước
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Quản lý nhân viên',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[700],
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Có thể show/hide TextField tìm kiếm ở AppBar nếu muốn
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Thanh tìm kiếm nhân viên
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Tìm nhân viên',
                hintText: 'Nhập tên hoặc mã NV',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Bảng danh sách nhân viên
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 12,
                  headingRowColor:
                      WidgetStateProperty.all(Colors.blue[50]),
                  columns: [
                    DataColumn(label: Text('STT')),
                    DataColumn(label: Text('Mã NV')),
                    DataColumn(label: Text('Tên NV')),
                    DataColumn(label: Text('Chức vụ')),
                    DataColumn(label: Text('SĐT')),
                    DataColumn(label: Text('Ngày vào')),
                    DataColumn(label: Text('Chấm công')),
                    DataColumn(label: Text('Hành động')),
                  ],
                  rows: _filteredEmployees.map((emp) {
                    final originalIndex =
                        _employees.indexOf(emp); // index gốc để xóa
                    final hasCheckedIn = emp['lastCheckIn'] == _todayString;

                    return DataRow(cells: [
                      DataCell(Text(emp['id'].toString())),
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 80),
                          child: Text(
                            emp['code'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 120),
                          child: Text(
                            emp['name'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 100),
                          child: Text(
                            emp['position'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 100),
                          child: Text(
                            emp['phone'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(Text(emp['joinDate'])),
                      DataCell(
                        // Icon ✓ hoặc ✗ để thể hiện trạng thái chấm công
                        IconButton(
                          icon: Icon(
                            hasCheckedIn
                                ? Icons.check_circle
                                : Icons.cancel,
                            color:
                                hasCheckedIn ? Colors.green : Colors.red,
                          ),
                          onPressed: hasCheckedIn
                              ? null
                              : () => _checkInEmployee(originalIndex),
                          tooltip: hasCheckedIn
                              ? 'Đã chấm công hôm nay'
                              : 'Chấm công',
                        ),
                      ),
                      DataCell(
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _removeEmployee(originalIndex);
                          },
                          tooltip: 'Xóa nhân viên',
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

      // Nút thêm nhân viên
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddEmployeeDialog,
        backgroundColor: Colors.green[700],
        tooltip: 'Thêm nhân viên',
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
        currentIndex: 3, // index của mục "Nhân viên"
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          // Xử lý chuyển page nếu cần
        },
      ),
    );
  }
}
