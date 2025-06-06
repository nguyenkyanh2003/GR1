import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class CardHangbanchay extends StatefulWidget {
  const CardHangbanchay({super.key});

  @override
  State<CardHangbanchay> createState() => _CardHangbanchayState();
}

class _CardHangbanchayState extends State<CardHangbanchay> {
  bool _byRevenue = true;

  // Giả lập dữ liệu top 5 sản phẩm
  final List<Map<String, dynamic>> _fakeData = [
    {'name': 'Phở Bò', 'revenue': 800000.0, 'quantity': 40},
    {'name': 'Bún Chả', 'revenue': 650000.0, 'quantity': 30},
    {'name': 'Cơm Gà', 'revenue': 720000.0, 'quantity': 35},
    {'name': 'Bánh Mì', 'revenue': 500000.0, 'quantity': 50},
    {'name': 'Mì Xào', 'revenue': 600000.0, 'quantity': 25},
  ];

  @override
  Widget build(BuildContext context) {
    final NumberFormat vndFmt =
        NumberFormat.currency(locale: 'vi_VN', symbol: ' VNĐ', decimalDigits: 0);

    // Lấy dữ liệu theo doanh thu hoặc số lượng
    final sorted = List<Map<String, dynamic>>.from(_fakeData);
    if (_byRevenue) {
      sorted.sort((a, b) => b['revenue'].compareTo(a['revenue']));
    } else {
      sorted.sort((a, b) => b['quantity'].compareTo(a['quantity']));
    }

    final maxValue = _byRevenue
        ? sorted.first['revenue'] as double
        : sorted.first['quantity'] as int;

    return Card(
      color: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hàng bán chạy",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _byRevenue = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _byRevenue ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: BorderSide(
                        color: _byRevenue ? Colors.blue : Colors.grey),
                  ),
                  child: Text(
                    "Theo doanh thu",
                    style: TextStyle(
                      fontSize: 16,
                      color: _byRevenue ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _byRevenue = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !_byRevenue ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side: BorderSide(
                        color: !_byRevenue ? Colors.blue : Colors.grey),
                  ),
                  child: Text(
                    "Theo số lượng",
                    style: TextStyle(
                      color: !_byRevenue ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: _byRevenue ? maxValue * 1.2 : (maxValue as int) * 1.2,
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: _byRevenue
                            ? maxValue / 4
                            : (maxValue as int) / 4,
                        reservedSize: 60,
                        getTitlesWidget: (value, meta) {
                          if (_byRevenue) {
                            return Text(
                              vndFmt.format(value),
                              style: const TextStyle(fontSize: 10),
                            );
                          } else {
                            return Text(
                              '${value.toInt()}',
                              style: const TextStyle(fontSize: 10),
                            );
                          }
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final idx = value.toInt();
                          if (idx < 0 || idx >= sorted.length) {
                            return const SizedBox.shrink();
                          }
                          final name = sorted[idx]['name'] as String;
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              name,
                              style: const TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                        interval: 1,
                        reservedSize: 40,
                      ),
                    ),
                    topTitles: AxisTitles(),
                    rightTitles: AxisTitles(),
                  ),
                  gridData: FlGridData(
                    show: true,
                    getDrawingHorizontalLine: (y) => FlLine(
                      color: Colors.grey.withOpacity(0.3),
                      strokeWidth: 1,
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: sorted.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final item = entry.value;
                    final yValue = _byRevenue
                        ? (item['revenue'] as double)
                        : (item['quantity'] as int).toDouble();
                    return BarChartGroupData(
                      x: idx,
                      barRods: [
                        BarChartRodData(
                          toY: yValue,
                          color: Colors.blueAccent,
                          width: 18,
                          borderRadius: BorderRadius.circular(6),
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
