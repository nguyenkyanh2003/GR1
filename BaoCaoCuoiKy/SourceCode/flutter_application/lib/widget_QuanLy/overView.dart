import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI_IconsButton/KhachHangScreen.dart';
import 'package:flutter_application_1/UI_IconsButton/KiemKhoScreen.dart';
import 'package:flutter_application_1/UI_IconsButton/NhanVienScreen.dart';
import 'package:flutter_application_1/UI_IconsButton/ThuChiScreen.dart';
import './icon_button.dart';
import 'package:flutter_application_1/UI_IconsButton/NhapHangScreen.dart';

class OverviewCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const OverviewCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Gán dữ liệu giả nếu rỗng hoặc thiếu
    final orders = data['orders'] ?? '120';
    final servingOrders = data['servingOrders'] ?? 'Đang phục vụ: 8';
    final tables = data['tables'] ?? '25 bàn';
    final guests = data['guests'] ?? '80 khách';

    return Card(
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
                      orders,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      servingOrders,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      tables,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      guests,
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
                buildIconButton(Icons.account_balance_wallet, Colors.blue, 'Thu-Chi', onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThuChiScreen()),
                  );
                }),
                buildIconButton(Icons.inventory, Colors.green, 'Quản lý kho', onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KiemKhoScreen()),
                  );
                }),
                buildIconButton(Icons.download, Colors.blue, 'Nhập hàng', onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NhapHangScreen()),
                  );
                }),
                buildIconButton(Icons.person, Colors.green, 'Nhân viên', onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NhanVienScreen()),
                  );
                }),
                buildIconButton(Icons.group, Colors.blue, 'Khách hàng', onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KhachHangScreen()),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
