import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: SafeArea(
      child: KiemKhoScreen()
      ),
    debugShowCheckedModeBanner: false,
  ));
}
class BienThanhPhan{
  final String code;
  final String name;
  final int soLuong;
  BienThanhPhan({required this.code, required this.name, required this.soLuong});
}
class KiemKhoScreen extends StatefulWidget{
  const KiemKhoScreen({super.key});

  @override
  State<StatefulWidget> createState() =>_KiemKhoScreen();

}
class _KiemKhoScreen extends State<KiemKhoScreen> {
  final List<BienThanhPhan> _danhSachSP = [];// danh sách sp
  final  _timKiemController = TextEditingController();
  final  _nameController = TextEditingController();
  final  _codeController = TextEditingController();
  final  _countController = TextEditingController();
  List<BienThanhPhan> _danhSachSP1 = [];// danh sách sản phẩm đã lọc
  
  @override
  void initState(){// hàm khởi tạo trạng thái
  super.initState();
  _danhSachSP1 = _danhSachSP;// ds lọc tìm kiếm bằng ds gốc
  _timKiemController.addListener(danhSachSP);
  }
  void danhSachSP(){ // lọc sp theo từ khóa tìm kiếm
  final input = _timKiemController.text.toLowerCase();// lấy từ khóa tìm kiếm chuyển thành chữ thường
  setState(() {
    _danhSachSP1 = _danhSachSP.where((SP)
    {
      return SP.name.toLowerCase().contains(input)|| SP.code.toLowerCase().contains(input);
    }).toList();// kết quả hiển thị theo dạng danh sách
  });
  }
  void _addSP(){
    if(_nameController.text.isNotEmpty&&_codeController.text.isNotEmpty&&_countController.text.isNotEmpty)
    {
      setState(() {
        _danhSachSP.add(BienThanhPhan(
          code: _codeController.text,
           name: _nameController.text, 
           soLuong: int.parse(_countController.text)// lưu dữ liệu nhập vào biến thành phần
          ));
           _danhSachSP1 = _danhSachSP;// cập nhật ds sản phẩm
      });
      _nameController.clear();
      _codeController.clear();
      _countController.clear();
      
    }
  }
  void _deleteSP(int index){
    setState(() {
      _danhSachSP.removeAt(index);// xóa sp tại vị trí của index
      _danhSachSP1 = _danhSachSP;
    });
  }
  void _showAddSPDialog(){
    showDialog(
      context: context,
       builder:(context) => AlertDialog(// tạo dialog
        title: Text("Thêm sản phẩm"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,// liên kết với controller để lưu
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              decoration: const InputDecoration(
                labelText: "Tên sản phẩm",
                hintText: "Nhập tên sản phẩm bạn muốn thêm",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _codeController,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: "Mã sản phẩm",
                hintText: "Nhập mã sản phẩm bạn muốn thêm",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _countController,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black
              ),
              decoration: InputDecoration(
                labelText: "Số lượng sản phẩm",
                hintText: "Nhập số lượng sản phẩm của bạn",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          ElevatedButton(onPressed:()=>Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red
          ), 
          child: Text("Hủy",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),),
          ),
          ElevatedButton(onPressed: (){
            _addSP();
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ), 
          child: Text("Thêm",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),),
          )
        ],
       ),
       );
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
appBar: AppBar(
  title: Text("Quản lý kiểm kho",
  style: TextStyle(
    fontSize: 30,
    color: Colors.black,
  ),),
  leading: IconButton(onPressed:()=> Navigator.pop(context),
   icon: Icon(Icons.arrow_back_rounded)),
   backgroundColor: Colors.blue,
),
body: Padding(
  padding: EdgeInsets.all(16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextField(
        controller: _timKiemController,
        decoration: const InputDecoration(
          labelText: "Tìm kiểm sản phẩm",
          hintText: "Nhập tên hoặc mã sản phẩm mà bạn muốn tìm",
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 20,),
      Expanded(// dùng để chiếm toàn bộ không gian còn lại của row hoặc column
        child: ListView.builder(// danh sách động
          itemCount: _danhSachSP1.length,// số lượng sản phẩm hiển thị
          itemBuilder: (context, index) {// xây từng mục
            final SP = _danhSachSP1[index];// lấy sản phẩm tại vtri index
            return ListTile(// mục danh sách
            title: Text(SP.name),
            subtitle: Text("Mã: ${SP.code} |SL: ${SP.soLuong}"),
            trailing: IconButton(
              onPressed: ()=>_deleteSP(index), 
            icon: const Icon(Icons.delete,color: Colors.red,)),
            );
          },
        )
        ),
    ],
  ),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: _showAddSPDialog,
    child: const Icon(Icons.add),
    ),
     bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Tổng Quan"),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: "Hàng hóa"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Hóa đơn'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Sổ quỹ'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Công cụ'),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (value) {},
      ),
    );

  }
  @override
  void dispose()// làm sạch khi widget bị xóa
  {
    _timKiemController.dispose();
    _nameController.dispose();
    _countController.dispose();
    _codeController.dispose();
    super.dispose();
  }

}