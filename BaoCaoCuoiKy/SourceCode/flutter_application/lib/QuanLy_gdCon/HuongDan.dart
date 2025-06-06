import 'package:flutter/material.dart';

class HuongDan extends StatelessWidget{
    const HuongDan({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
        title: Stack( 
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Tổng quan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(// set up góc trái bên phải
            right: 0,
            top: 0,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog khi nhấn nút X
              },
            ),
          ),
        ],
      ),
        content: SingleChildScrollView(
            child: ListBody(
                children: [
                const Text(
                    "Chào mừng bạn đến ứng dụng GoodFood!",
                    style: TextStyle(
                        fontSize: 16,
                    ),
                ),
                const SizedBox(height: 10,),
                Card(
            color: Colors.white.withOpacity(0.9),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            elevation: 10,
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                    text: TextSpan(
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                        ),
                        children: [
                        TextSpan(
                            text: "Ngay khi truy cập vào ứng dụng Quản lý nhà hàng, giao diện đầu tiên bạn thấy chính là màn hình ",
                        ),
                        TextSpan(
                            text: 'Tổng quan',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                            ),
                        ),
                        TextSpan(
                            text: ". Đây là nơi mang đến cho bạn cái nhìn tổng quan về các hoạt động kinh doanh tại nhà hàng của bạn, đặc biệt là các thông tin về tình hình hoạt động kinh doanh của nhà hàng",
                        ),
                        ]
                    ),
                ),
                ),
                ),
                ]
            ),
        ),
    );
  }
    
}