import 'package:flutter/material.dart';

class CardSoluongkh extends StatelessWidget {
  const CardSoluongkh({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: Colors.white.withOpacity(0.9),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Số lượng khách hàng",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Chưa có dữ liệu",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  ),
                  Text("Số lượng khách hàng sẽ hiển thị tại đây",
                  style: TextStyle(
                     fontSize: 16,
                    color: Colors.grey,
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          ],
        ),
      ),
    );
  }
          
}