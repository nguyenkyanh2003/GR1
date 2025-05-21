import 'package:flutter/material.dart';

class CardDoanhthu extends StatelessWidget {
  const CardDoanhthu({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
    );
  }
}