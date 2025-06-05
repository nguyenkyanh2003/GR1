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
      home: InventoryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
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
  ];

  // Form nhập liệu
  void _showAddItemDialog() {
    String name = '';
    int quantity = 0;
    int price = 0;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Thêm hàng mới'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Tên hàng'),
              onChanged: (value) => name = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Số lượng'),
              keyboardType: TextInputType.number,
              onChanged: (value) => quantity = int.tryParse(value) ?? 0,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Đơn giá'),
              keyboardType: TextInputType.number,
              onChanged: (value) => price = int.tryParse(value) ?? 0,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              if (name.isNotEmpty && quantity > 0 && price > 0) {
                setState(() {
                  _inventoryItems.add({
                    'id': _inventoryItems.length + 1,
                    'name': name,
                    'quantity': quantity,
                    'price': price,
                    'total': quantity * price,
                    'supplier': 'NCC A',
                    'date': DateTime.now().toString().split(' ')[0], // Cập nhật ngày hiện tại
                  });
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý nhập hàng', style: TextStyle(color: Colors.white)),
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
            padding: const EdgeInsets.only(left: 20),
               child:  Card(
                  color: Colors.white,
                  elevation:10,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text('0 hóa đơn', style: TextStyle(fontSize: 16)),
                        Text('Hôm nay', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                ),   
          ),
          // Bộ lọc
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  hint: Text('Tất cả nhà cung cấp'),
                  items: <String>['NCC A', 'NCC B', 'Tất cả'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                  child: Text('Lọc theo ngày'),
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
                headingRowColor: WidgetStateProperty.all(Colors.blue[50]),
                columns: [
                  DataColumn(label: Text('STT')),
                  DataColumn(label: Text('Tên hàng')),
                  DataColumn(label: Text('Số lượng')),
                  DataColumn(label: Text('Đơn giá')),
                  DataColumn(label: Text('Tổng tiền')),
                  DataColumn(label: Text('Nhà cung cấp')),
                  DataColumn(label: Text('Ngày nhập')),
                ],
                rows: _inventoryItems.map((item) {
                  return DataRow(cells: [
                    DataCell(Text(item['id'].toString())),
                    DataCell(Text(item['name'], overflow: TextOverflow.ellipsis)),
                    DataCell(Text(item['quantity'].toString())),
                    DataCell(Text('${item['price']} đ', overflow: TextOverflow.ellipsis)),
                    DataCell(Text('${item['total']} đ', overflow: TextOverflow.ellipsis)),
                    DataCell(Text(item['supplier'], overflow: TextOverflow.ellipsis)),
                    DataCell(Text(item['date'], overflow: TextOverflow.ellipsis)),
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
  }
