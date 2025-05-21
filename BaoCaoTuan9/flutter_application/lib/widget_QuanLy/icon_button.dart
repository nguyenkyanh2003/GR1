import 'package:flutter/material.dart';

Widget buildIconButton(IconData icon, Color color, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        icon: Icon(icon, color: color),
        onPressed: () {},
      ),
      Text(
        label,
        style: const TextStyle(fontSize: 12, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    ],
  );
}