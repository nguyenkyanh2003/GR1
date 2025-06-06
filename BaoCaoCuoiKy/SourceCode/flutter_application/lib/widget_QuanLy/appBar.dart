import 'package:flutter/material.dart';
import 'package:flutter_application_1/QuanLy_gdCon/HuongDan.dart';

PreferredSizeWidget buildAppBar({
  required BuildContext context, // Thêm tham số context
  required String selectedValue,
  required List<String> ngay,
  required Function(String) onChanged,
}) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Image.asset(
        'assets/images/Logo.jpg',
        width: 200,
        height: 200,
      ),
    ),
    title: const Text(
      "GoodFood",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    ),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
      IconButton(
        onPressed: () {
          showDialog(
            context: context, // Sử dụng context đã truyền vào
            builder: (BuildContext context) {
              return const HuongDan();
            },
          );
        },
        icon: const Icon(Icons.help),
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    flexibleSpace: Container(
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
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton(
              value: selectedValue,
              items: ngay
                  .map(
                    (String value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  onChanged(value);
                }
              },
              dropdownColor: Colors.white,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              underline: Container(
                height: 1,
                color: Colors.grey,
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}