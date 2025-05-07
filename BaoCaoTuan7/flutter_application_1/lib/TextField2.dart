import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              GestureDetector(
                onTap: (){
                  print("Bạn đã ấn App");
                },
                child: Icon(
                  color: Colors.black,
                  Icons.apps,
                ),
              ),
            SizedBox(width: 5,),
            Text("Text Field2"),
            ],
          ),
  backgroundColor: Colors.blue,
  shadowColor: Colors.green,
  elevation: 10,
  actions: [
    Icon(
      Icons.clear,
    ),
  ],
        ),
        body: UI(),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
class UI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UI();
}
class _UI extends State<UI> {
    final _textController  = TextEditingController();
    String _inputText = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,// căn giữa theo chiều dọc
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,// căn giữa theo chiều ngang
          children: [
           TextField(
            controller: _textController,//Đối tượng sử lý nội dung
            decoration: InputDecoration(
              labelText: "Nhập thông tin",
              hintText: "Nhập thông tin của bạn",
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.person,
              ),
              suffixIcon: IconButton(
                onPressed: (){
                  _textController.clear();// khi ấn icon sẽ mất hết chữ
                }, 
                icon: Icon(
                  Icons.clear,
                )
                )
            ),
            onChanged: (value){// onChanged dùng để bắt những sự kiện khi thay đổi
              setState(() {// setState dùng để nhập lại gd của chương trình
                _inputText = value;
              });
            } ,
           ),
           SizedBox(height: 20,),
           Text("Bạn vừa nhập: $_inputText",
           style: TextStyle(
            fontSize: 14
           ),),
          ],
        ),
        ),
    );
  }

}