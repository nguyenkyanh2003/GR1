import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CardSoluongkh extends StatelessWidget {
  const CardSoluongkh({super.key});

  @override
  Widget build(BuildContext context) {
    // Giả lập dữ liệu
    final int totalCustomers = 120;      // Tổng số khách hàng
    final int newCustomers = 35;         // Khách hàng mới
    final int returningCustomers = 85;   // Khách hàng quay lại

    // Chuyển dữ liệu thành danh sách đôi (index, value) cho biểu đồ
    final barGroups = [
      BarChartGroupData(
        x: 0,
        barRods: [BarChartRodData(toY: totalCustomers.toDouble(), color: Colors.blue)],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [BarChartRodData(toY: newCustomers.toDouble(), color: Colors.green)],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [BarChartRodData(toY: returningCustomers.toDouble(), color: Colors.orange)],
      ),
    ];

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
              "Số lượng khách hàng",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCustomerInfo(
                  value: totalCustomers.toString(),
                  label: "Tổng KH",
                  color: Colors.blue,
                ),
                _buildCustomerInfo(
                  value: newCustomers.toString(),
                  label: "Mới",
                  color: Colors.green,
                ),
                _buildCustomerInfo(
                  value: returningCustomers.toString(),
                  label: "Cũ",
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: ([
                        totalCustomers.toDouble(),
                        newCustomers.toDouble(),
                        returningCustomers.toDouble()
                      ].reduce((a, b) => a > b ? a : b) *
                      1.2),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 20,
                        getTitlesWidget: (value, meta) {
                          if (value % 20 != 0) return const SizedBox.shrink();
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(fontSize: 12),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text("Tổng", style: TextStyle(fontSize: 12));
                            case 1:
                              return const Text("Mới", style: TextStyle(fontSize: 12));
                            case 2:
                              return const Text("Quay", style: TextStyle(fontSize: 12));
                            default:
                              return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(),
                    topTitles: AxisTitles(),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (y) => FlLine(
                      color: Colors.grey.withOpacity(0.3),
                      strokeWidth: 1,
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: barGroups,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerInfo({
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
      ],
    );
  }
}
