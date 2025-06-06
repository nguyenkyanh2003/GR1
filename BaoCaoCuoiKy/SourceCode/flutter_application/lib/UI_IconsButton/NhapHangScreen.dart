import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nhập hàng',
      theme: ThemeData(
        primaryColor: Colors.blue[700],
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: NhapHangScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NhapHangScreen extends StatefulWidget {
  const NhapHangScreen({super.key});

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<NhapHangScreen> {
  // Dữ liệu mẫu
  final List<Map<String, dynamic>> _inventoryItems = [
    {
      'id': 1,
      'name': 'Gạo ST25',
      'quantity': 50,
      'price': 20000,
      'total': 1000000,
      'supplier': 'NCC A',
      'date': '28/05/2025',
    },
    {
      'id': 2,
      'name': 'Nước mắm',
      'quantity': 20,
      'price': 30000,
      'total': 600000,
      'supplier': 'NCC B',
      'date': '27/05/2025',
    },
    {
      'id': 3,
      'name': 'Dầu ăn',
      'quantity': 30,
      'price': 40000,
      'total': 1200000,
      'supplier': 'NCC A',
      'date': '26/05/2025',
    },
    // Có thể thêm nhiều dòng mẫu khác...
  ];

  // Dữ liệu sau khi lọc
  List<Map<String, dynamic>> _filteredItems = [];

  // Để lưu trạng thái dropdown và ngày
  String? _selectedSupplier;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    // Ban đầu chưa lọc gì => = gốc
    _filteredItems = List.from(_inventoryItems);
  }

  // Chuyển string "dd/MM/yyyy" thành DateTime
  DateTime? _parseDate(String dateStr) {
    try {
      final parts = dateStr.split('/');
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);
      return DateTime(year, month, day);
    } catch (e) {
      return null;
    }
  }

  // Hàm áp dụng bộ lọc: supplier + ngày
  void _applyFilter() {
    setState(() {
      _filteredItems = _inventoryItems.where((item) {
        // Lọc theo nhà cung cấp
        bool matchesSupplier = true;
        if (_selectedSupplier != null && _selectedSupplier != 'Tất cả') {
          matchesSupplier = item['supplier'] == _selectedSupplier;
        }

        // Lọc theo ngày
        bool matchesDate = true;
        if (_selectedDate != null) {
          final itemDate = _parseDate(item['date']);
          if (itemDate == null) {
            matchesDate = false;
          } else {
            // So sánh ngày là same day
            matchesDate = (itemDate.year == _selectedDate!.year &&
                itemDate.month == _selectedDate!.month &&
                itemDate.day == _selectedDate!.day);
          }
        }

        return matchesSupplier && matchesDate;
      }).toList();
    });
  }

  // Hiển thị DatePicker để chọn ngày lọc
  Future<void> _pickDate(BuildContext context) async {
    final today = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? today,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _applyFilter();
      });
    }
  }

  // Chuẩn bị danh sách các nhà cung cấp cho dropdown (distinct)
  List<String> get _allSuppliers {
    final suppliers =
        _inventoryItems.map((item) => item['supplier'] as String).toSet();
    final sortedList = suppliers.toList()..sort();
    return ['Tất cả', ...sortedList];
  }

  // Form nhập liệu - giữ nguyên ban đầu (chưa dùng bộ lọc)
  void _showAddItemDialog() {
    String name = '';
    int quantity = 0;
    int price = 0;
    String supplier = _allSuppliers.length > 1 ? _allSuppliers[1] : 'Tất cả';
    DateTime date = DateTime.now();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setDialogState) {
        // StatefulBuilder để cập nhật dropdown và datePicker bên trong AlertDialog
        return AlertDialog(
          title: Text('Thêm hàng mới'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Tên hàng'),
                  onChanged: (value) => name = value,
                ),
                SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(labelText: 'Số lượng'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => quantity = int.tryParse(value) ?? 0,
                ),
                SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(labelText: 'Đơn giá'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => price = int.tryParse(value) ?? 0,
                ),
                SizedBox(height: 12),
                // Dropdown chọn NCC
                DropdownButtonFormField<String>(
                  value: supplier,
                  items: _allSuppliers
                      .where((s) => s != 'Tất cả')
                      .map((s) => DropdownMenuItem(
                            value: s,
                            child: Text(s),
                          ))
                      .toList(),
                  decoration: InputDecoration(labelText: 'Nhà cung cấp'),
                  onChanged: (value) {
                    if (value != null) {
                      setDialogState(() {
                        supplier = value;
                      });
                    }
                  },
                ),
                SizedBox(height: 12),
                // Hiển thị ngày đã chọn & nút chọn ngày
                Row(
                  children: [
                    Text(
                      'Ngày nhập: ${date.day}/${date.month}/${date.year}',
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setDialogState(() => date = picked);
                        }
                      },
                      child: Text('Chọn ngày',
                      style: TextStyle(
                        color: Colors.black
                      ),),
                    )
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty && quantity > 0 && price > 0) {
                  final newItem = {
                    'id': _inventoryItems.length + 1,
                    'name': name,
                    'quantity': quantity,
                    'price': price,
                    'total': quantity * price,
                    'supplier': supplier,
                    'date': '${date.day.toString().padLeft(2, '0')}/'
                        '${date.month.toString().padLeft(2, '0')}/'
                        '${date.year}',
                  };
                  setState(() {
                    _inventoryItems.add(newItem);
                    _applyFilter(); // đảm bảo lọc lại nếu đang có filter
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đã thêm $name thành công!')),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Quản lý nhập hàng', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thống kê nhanh
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 12),
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text('${_filteredItems.length} hóa đơn',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ),

          // Bộ lọc: Dropdown NCC + Chọn ngày
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                // Dropdown Nhà cung cấp
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedSupplier ?? 'Tất cả',
                    items: _allSuppliers
                        .map((supplier) => DropdownMenuItem<String>(
                              value: supplier,
                              child: Text(supplier),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Nhà cung cấp',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _selectedSupplier = value;
                        _applyFilter();
                      });
                    },
                  ),
                ),
                SizedBox(width: 12),
                // Nút chọn ngày
                ElevatedButton.icon(
                  onPressed: () => _pickDate(context),
                  icon: Icon(Icons.date_range),
                  label: Text(_selectedDate == null
                      ? 'Chọn ngày'
                      : '${_selectedDate!.day.toString().padLeft(2, '0')}/'
                          '${_selectedDate!.month.toString().padLeft(2, '0')}/'
                          '${_selectedDate!.year}',
                          style: TextStyle(
                            color: Colors.white
                          ),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
                SizedBox(width: 8),
                // Nút "Xóa filter ngày" nếu đã chọn
                if (_selectedDate != null)
                  IconButton(
                    icon: Icon(Icons.clear, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        _selectedDate = null;
                        _applyFilter();
                      });
                    },
                  ),
              ],
            ),
          ),

          // Bảng dữ liệu
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 16,
                headingRowColor:
                    WidgetStateProperty.all(Colors.blue[50]),
                columns: [
                  DataColumn(label: Text('STT')),
                  DataColumn(label: Text('Tên hàng')),
                  DataColumn(label: Text('Số lượng')),
                  DataColumn(label: Text('Đơn giá')),
                  DataColumn(label: Text('Tổng tiền')),
                  DataColumn(label: Text('Nhà cung cấp')),
                  DataColumn(label: Text('Ngày nhập')),
                  DataColumn(label: Text('Hành động')),
                ],
                rows: _filteredItems.map((item) {
                  final index = _inventoryItems.indexOf(item);
                  return DataRow(cells: [
                    DataCell(Text(item['id'].toString())),
                    DataCell(
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 120),
                        child: Text(item['name'],
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    DataCell(Text(item['quantity'].toString())),
                    DataCell(Text('${item['price']} đ',
                        overflow: TextOverflow.ellipsis)),
                    DataCell(Text('${item['total']} đ',
                        overflow: TextOverflow.ellipsis)),
                    DataCell(Text(item['supplier'],
                        overflow: TextOverflow.ellipsis)),
                    DataCell(Text(item['date'],
                        overflow: TextOverflow.ellipsis)),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _inventoryItems.removeAt(index);
                            _applyFilter();
                          });
                        },
                      ),
                    ),
                  ]);
                }).toList(),
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _showAddItemDialog,
        backgroundColor: Colors.green[700],
        tooltip: 'Thêm hàng',
        child: Icon(Icons.add),
      ),

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
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (value) {},
      ),
    );
  }
}
