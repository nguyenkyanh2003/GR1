import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardHangtonkho extends StatelessWidget {
  final Map<String, dynamic> data;

  const CardHangtonkho({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final int quantity = data['inventoryQuantity'] is int
        ? data['inventoryQuantity']
        : int.tryParse(data['inventoryQuantity']?.toString() ?? '') ?? 0;

    final double totalValue = data['inventoryTotal'] is num
        ? (data['inventoryTotal'] as num).toDouble()
        : double.tryParse(data['inventoryTotal']?.toString() ?? '') ?? 0.0;

    final NumberFormat currencyFormatter =
        NumberFormat.currency(locale: 'vi_VN', symbol: ' VNĐ', decimalDigits: 0);
    final formattedTotal = currencyFormatter.format(totalValue);

    return Card(
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
                  "Số lượng hàng",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 7, 106),
                  ),
                ),
              ],
            ),
            const Divider(),
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
                  formattedTotal,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 255, 64, 134),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Ví dụ cách sử dụng ở parent widget:
class ParentScreen extends StatelessWidget {
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Giả sử đây là dữ liệu thực tế lấy được
    final Map<String, dynamic> inventoryData = {
      'inventoryQuantity': 200,
      'inventoryTotal': 3500000, // 3.500.000 VNĐ
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Tổng Quan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CardHangtonkho(data: inventoryData),
      ),
    );
  }
}
