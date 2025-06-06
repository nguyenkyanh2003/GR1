import 'package:flutter/material.dart';
import 'package:flutter_application_1/IconBottom/CongCu.dart';
import '../widget_QuanLy/appBar.dart';
import '../widget_QuanLy/card_DoanhThu.dart';
import '../widget_QuanLy/card_HangBanChay.dart';
import '../widget_QuanLy/card_HangTonKho.dart';
import '../widget_QuanLy/card_HuyMon.dart';
import '../widget_QuanLy/overView.dart';
import '../data/constants.dart';
import '../data/database.dart';
import '../widget_QuanLy/card_SoLuongKH.dart';

class QuanLy extends StatefulWidget {
  const QuanLy({super.key});

  @override
  State<QuanLy> createState() => _QuanLyState();
}

class _QuanLyState extends State<QuanLy> {
  String _selectedValue = 'Hôm nay';
  int _selectedIndex = 0;
  final QuanLyData _quanLyData = QuanLyData();

  @override
  void initState() {
    super.initState();
    _quanLyData.updateData(_selectedValue);
  }

  void _updateData(String value) {
    setState(() {
      _selectedValue = value;
      _quanLyData.updateData(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(
        context: context,
        selectedValue: _selectedValue,
        ngay: ngayList,
        onChanged: _updateData,
      ),
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
            padding: EdgeInsets.fromLTRB(
              10.0,
              MediaQuery.of(context).size.height * 0.15,
              10.0,
              10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                OverviewCard(data: _quanLyData.data),
                const SizedBox(height: 10),
                const CardDoanhthu(),//doanh thu
                const SizedBox(height: 10),
                const CardSoluongkh(),
                const SizedBox(height: 10,),
                CardHangtonkho(data: _quanLyData.data),//tồn kho
                const SizedBox(height: 10),
                const CardHangbanchay(),// hàng bán chạy
                const SizedBox(height: 10),
                CardHuymon(cancelItems: _quanLyData.data['cancelItems']),//hủy món
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  currentIndex: _selectedIndex,
  selectedItemColor: Colors.blue,
  unselectedItemColor: Colors.grey,
  onTap: (index) {
    if (index == 4) {
      setState(() {
        _selectedIndex = index;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text("Công cụ")),
            body: const CongCu(),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: 4, // giữ màu chọn
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              onTap: (value) {
                if (value != 4) {
                  Navigator.pop(context); // quay lại màn hình chính
                }
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Tổng Quan"),
                BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: "Hàng hóa"),
                BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Hóa đơn'),
                BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Sổ quỹ'),
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Công cụ'),
              ],
            ),
          ),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
      // Nếu cần thêm chuyển trang tương ứng với index khác thì xử lý tại đây
    }
  },
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Tổng Quan"),
    BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: "Hàng hóa"),
    BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Hóa đơn'),
    BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Sổ quỹ'),
    BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Công cụ'),
  ],
),

    );
  }
}