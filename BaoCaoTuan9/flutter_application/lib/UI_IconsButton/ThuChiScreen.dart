import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: ThuChiScreen(),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class ThuChiScreen extends StatefulWidget {
  const ThuChiScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ThuChiScreen();
}

class _ThuChiScreen extends State<ThuChiScreen> {
  Key _appKey = UniqueKey();
  Map<String, dynamic> Data = {
    'TongThu': 0.0,
    'TongChi': 0.0,
    'danhSach': [
      {'Title': 'Chi tiêu', 'Tien': '-500000.0', 'Ngay': '25/05/2025'},
      {'Title': 'Thu nhập', 'Tien': '+2000000.0', 'Ngay': '25/05/2025'}, // Sửa lỗi ngày
    ]
  };

  @override
  void initState() {
    super.initState();
    _sumThuChi();
  }

  void _sumThuChi() {
    double tongThu = 0.0;
    double tongChi = 0.0;
    for (var danhSach in Data['danhSach']) {
      double amount = double.parse(danhSach['Tien'].replaceAll('+', ''));
      if (danhSach['Title'] == 'Thu nhập') {
        tongThu += amount;
      } else {
        tongChi += amount.abs();
      }
    }
    setState(() {
      Data['TongThu'] = tongThu;
      Data['TongChi'] = tongChi;
    });
  }
  void _resetData(){
    setState(() {
      _appKey = UniqueKey();// làm mới giao diện
      _sumThuChi();//cập nhật tổng thu/chi
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _appKey,
      appBar: AppBar(
        title: Text("Thu-Chi"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_backspace_rounded),
        ),
        actions: [
          IconButton(
            onPressed: _resetData,
            icon: Icon(Icons.restart_alt_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddData()),
          ).then((newGD) {
            if (newGD != null) {
              setState(() {
                Data['danhSach'].add(newGD);
                _sumThuChi(); // Cập nhật tổng thu/chi sau khi thêm giao dịch
              });
            }
          });
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.white.withOpacity(0.9),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildItems("Thu nhập", "${Data['TongThu']} VNĐ", Colors.green),
                      _buildItems("Chi tiêu", "${Data['TongChi']} VNĐ", Colors.red),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Biểu đồ thu chi:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        color: Colors.yellow,
                        value: Data['TongThu'] == 0 && Data['TongChi'] == 0 ? 1 : Data['TongThu'],
                        title: "Thu",
                        radius: 50,
                        titleStyle: TextStyle(color: Colors.white),
                      ),
                      PieChartSectionData(
                        color: Colors.red,
                        value: Data['TongThu'] == 0 && Data['TongChi'] == 0 ? 1 : Data['TongChi'],
                        title: "Chi",
                        radius: 50,
                        titleStyle: TextStyle(color: Colors.white),
                      ),
                    ],
                    centerSpaceRadius: 40,
                    sectionsSpace: 2.0,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Data['danhSach'].length,
                itemBuilder: (context, index) {
                  var ds = Data['danhSach'][index];
                  return ListTile(
                    leading: Icon(
                      ds['Title'] == 'Chi tiêu' ? Icons.arrow_downward : Icons.arrow_upward,
                      color: ds['Title'] == 'Chi tiêu' ? Colors.red : Colors.green,
                    ),
                    title: Text(
                      ds['Title'],
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(ds['Ngay']),
                    trailing: Text(
                      "${ds['Tien'].replaceAll('+', '+').replaceAll('.0', '')} VNĐ",
                      style: TextStyle(color: ds['Title'] == 'Chi tiêu' ? Colors.red : Colors.green),
                    ),
                  );
                },
              )
            ],
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
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Công cụ'),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (value) {},
      ),
    );
  }

  Widget _buildItems(String title, String amount, Color color) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 16)),
        SizedBox(height: 5),
        Text(amount, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
      ],
    );
  }
}

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<StatefulWidget> createState() => _AddData();
}

class _AddData extends State<AddData> {
  final _formKey = GlobalKey<FormState>();
  final _moneyController = TextEditingController();
  String? _chonType;

  @override
  void dispose() {
    _moneyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm giao dịch"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_backspace_sharp),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _moneyController.clear();
                _chonType = null;
              });
            },
            icon: Icon(Icons.restart_alt_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _moneyController,
                decoration: InputDecoration(
                  labelText: "Số tiền",
                  hintText: "Nhập số tiền vào đây",
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập số tiền";
                  }
                  if (double.tryParse(value) == null) {
                    return "Vui lòng nhập số hợp lệ";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Loại giao dịch',
                ),
                value: _chonType,
                items: ['Thu nhập', 'Chi tiêu'].map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _chonType = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng chọn loại giao dịch";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      final amount = _chonType == 'Thu nhập'
          ? '+${_moneyController.text}'
          : '-${_moneyController.text}';
      var map = <String, String> {
        'Title': _chonType??'',
        'Tien': amount,
         'Ngay': '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
      };
      final newGD =map;// thêm này mới chạy được ???
      Navigator.pop(context, newGD);
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
  ),
  child: Text('Lưu'),
          ),
            ],
          ),
        ),
      ),
    );
  }
}