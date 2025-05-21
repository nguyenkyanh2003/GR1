import 'package:flutter/material.dart';
import './icon_button.dart';

class OverviewCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const OverviewCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
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
                      data['orders'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data['servingOrders'],
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      data['tables'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data['guests'],
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
                buildIconButton(Icons.account_balance_wallet, Colors.blue, 'Vay vốn'),
                buildIconButton(Icons.inventory, Colors.green, 'Kiểm kho'),
                buildIconButton(Icons.download, Colors.blue, 'Nhập hàng'),
                buildIconButton(Icons.person, Colors.green, 'Nhân viên'),
                buildIconButton(Icons.group, Colors.blue, 'Khách hàng'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}