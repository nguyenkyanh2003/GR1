import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class CardDoanhthu extends StatefulWidget {
  const CardDoanhthu({super.key});

  @override
  State<CardDoanhthu> createState() => _CardDoanhthuState();
}

class _CardDoanhthuState extends State<CardDoanhthu> {
  String _selected = 'Giờ';

  final NumberFormat _vndFormat =
      NumberFormat.currency(locale: 'vi_VN', symbol: ' VNĐ', decimalDigits: 0);

  final Map<String, List<double>> _dataMap = {
    'Giờ': [100000, 200000, 150000, 250000, 300000, 180000, 90000],
    'Ngày': [1200000, 1500000, 1000000, 1800000, 1300000, 1700000, 1400000],
    'Thứ': [6000000, 7200000, 5000000, 6800000, 7100000, 8000000, 7500000],
  };

  @override
  Widget build(BuildContext context) {
    final data = _dataMap[_selected] ?? [];
    final maxX = data.length - 1;
    final maxY = data.reduce((a, b) => a > b ? a : b);

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
              children: ['Giờ', 'Ngày', 'Thứ'].map((label) {
                return TextButton(
                  onPressed: () {
                    setState(() => _selected = label);
                  },
                  child: Text(
                    label,
                    style: TextStyle(
                      color: _selected == label ? Colors.blue : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: maxX.toDouble(),
                  minY: 0,
                  maxY: (maxY * 1.2),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (value < 0 || index < 0 || index > maxX) {
                            return const SizedBox.shrink();
                          }
                          if (_selected == 'Giờ') {
                            // Giờ: show 1..7 instead of 0..6
                            return Text(
                              '${index + 1}',
                              style: const TextStyle(fontSize: 12),
                            );
                          }
                          if (_selected == 'Ngày') {
                            return Text(
                              '${index + 1}',
                              style: const TextStyle(fontSize: 12),
                            );
                          }
                          // 'Thứ': show 2..8 (2=Thứ hai ... 8=Chủ nhật)
                          final dayNum = index + 2;
                          return Text(
                            '$dayNum',
                            style: const TextStyle(fontSize: 12),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: maxY / 4,
                        reservedSize: 60,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            _vndFormat.format(value),
                            style: const TextStyle(fontSize: 12),
                          );
                        },
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
                    getDrawingVerticalLine: (x) => FlLine(
                      color: Colors.grey.withOpacity(0.3),
                      strokeWidth: 1,
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: data.asMap().entries.map((e) {
                        return FlSpot(e.key.toDouble(), e.value);
                      }).toList(),
                      isCurved: true,
                      barWidth: 3,
                      color: Colors.blue,
                      dotData: FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
