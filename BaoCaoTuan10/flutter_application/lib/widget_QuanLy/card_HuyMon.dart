import 'package:flutter/material.dart';

class CardHuymon extends StatelessWidget {
  final List<Map<String, String>> cancelItems;

  const CardHuymon({super.key, required this.cancelItems});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hủy món",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            ...cancelItems.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> item = entry.value;
              return Column(
                children: [
                  _huyMon(
                    item['title']!,
                    item['percentage']!,
                    item['quantity']!,
                    item['revenue']!,
                  ),
                  if (index < cancelItems.length - 1) const Divider(),
                ],
              );
            }),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget _huyMon(String title, String percentage, String quantity, String revenue) {
    return InkWell(
      focusColor: Colors.blueGrey,
      highlightColor: Colors.blue,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(171, 0, 0, 0),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              percentage,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(171, 0, 0, 0),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chevron_right,
                              color: Color.fromARGB(171, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          quantity,
                          style: const TextStyle(color: Colors.grey, fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          revenue,
                          style: const TextStyle(color: Colors.grey, fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}