import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(child: KiemKhoScreen()),
    debugShowCheckedModeBanner: false,
  ));
}

// Model sản phẩm (BienThanhPhan) đã bổ sung các trường kiểm kho
class BienThanhPhan {
  final String code;
  final String name;
  final int soLuong;
  final String hanSuDung;    // Hạn sử dụng
  final int soDaDung;        // Số lượng đã dùng
  final int soConLai;        // Số lượng còn lại

  BienThanhPhan({
    required this.code,
    required this.name,
    required this.soLuong,
    required this.hanSuDung,
    required this.soDaDung,
    required this.soConLai,
  });
}

class KiemKhoScreen extends StatefulWidget {
  const KiemKhoScreen({super.key});

  @override
  State<StatefulWidget> createState() => _KiemKhoScreen();
}

class _KiemKhoScreen extends State<KiemKhoScreen> {
  // Controller cho tìm kiếm
  final _timKiemController = TextEditingController();

  // Controller cho dialog thêm SP
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  final _countController = TextEditingController();
  final _hanSuDungController = TextEditingController();
  final _soDaDungController = TextEditingController();
  final _soConLaiController = TextEditingController();

  // Danh sách gốc và danh sách đã lọc
  final List<BienThanhPhan> _danhSachSP = [];
  List<BienThanhPhan> _danhSachSP1 = [];

  @override
  void initState() {
    super.initState();
    // Khởi tạo danh sách lọc = danh sách gốc
    _danhSachSP1 = _danhSachSP;

    // Thêm listener để mỗi khi gõ tìm kiếm thì lọc lại
    _timKiemController.addListener(_locDanhSach);
  }

  // Hàm lọc danh sách SP theo tên hoặc mã
  void _locDanhSach() {
    final input = _timKiemController.text.toLowerCase();
    setState(() {
      _danhSachSP1 = _danhSachSP.where((sp) {
        return sp.name.toLowerCase().contains(input) ||
            sp.code.toLowerCase().contains(input);
      }).toList();
    });
  }

  // Thêm SP mới từ dialog
  void _addSP() {
    final name = _nameController.text.trim();
    final code = _codeController.text.trim();
    final countText = _countController.text.trim();
    final hanSuDung = _hanSuDungController.text.trim();
    final soDaDungText = _soDaDungController.text.trim();
    final soConLaiText = _soConLaiController.text.trim();

    if (name.isNotEmpty &&
        code.isNotEmpty &&
        countText.isNotEmpty &&
        hanSuDung.isNotEmpty &&
        soDaDungText.isNotEmpty &&
        soConLaiText.isNotEmpty) {
      final soLuong = int.tryParse(countText) ?? 0;
      final soDaDung = int.tryParse(soDaDungText) ?? 0;
      final soConLai = int.tryParse(soConLaiText) ?? 0;

      setState(() {
        _danhSachSP.add(BienThanhPhan(
          code: code,
          name: name,
          soLuong: soLuong,
          hanSuDung: hanSuDung,
          soDaDung: soDaDung,
          soConLai: soConLai,
        ));
        // Cập nhật danh sách đã lọc = gốc
        _danhSachSP1 = _danhSachSP;
      });

      // Xóa controller sau khi thêm
      _nameController.clear();
      _codeController.clear();
      _countController.clear();
      _hanSuDungController.clear();
      _soDaDungController.clear();
      _soConLaiController.clear();
    }
  }

  // Xóa SP tại vị trí index trong danh sách gốc
  void _deleteSP(int index) {
    setState(() {
      _danhSachSP.removeAt(index);
      _danhSachSP1 = _danhSachSP;
    });
  }

  // Hiển thị dialog thêm SP
  void _showAddSPDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Thêm sản phẩm"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tên sản phẩm
              TextField(
                controller: _nameController,
                style: TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                  labelText: "Tên sản phẩm",
                  hintText: "Nhập tên sản phẩm",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),

              // Mã sản phẩm
              TextField(
                controller: _codeController,
                style: TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                  labelText: "Mã sản phẩm",
                  hintText: "Nhập mã sản phẩm",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),

              // Số lượng tổng
              TextField(
                controller: _countController,
                style: TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                  labelText: "Số lượng tổng",
                  hintText: "Nhập số lượng hiện có",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12),

              // Hạn sử dụng
              TextField(
                controller: _hanSuDungController,
                style: TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                  labelText: "Hạn sử dụng",
                  hintText: "dd/mm/yyyy",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),

              // Số lượng đã dùng
              TextField(
                controller: _soDaDungController,
                style: TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                  labelText: "Số lượng đã dùng",
                  hintText: "Nhập số đã dùng",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12),

              // Số lượng còn lại
              TextField(
                controller: _soConLaiController,
                style: TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                  labelText: "Số lượng còn lại",
                  hintText: "Nhập số còn lại",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          // Nút Hủy
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(
              "Hủy",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),

          // Nút Thêm
          ElevatedButton(
            onPressed: () {
              _addSP();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: Text(
              "Thêm",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timKiemController.dispose();
    _nameController.dispose();
    _codeController.dispose();
    _countController.dispose();
    _hanSuDungController.dispose();
    _soDaDungController.dispose();
    _soConLaiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quản lý kiểm kho",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thanh tìm kiếm
            TextField(
              controller: _timKiemController,
              decoration: InputDecoration(
                labelText: "Tìm kiếm sản phẩm",
                hintText: "Nhập tên hoặc mã sản phẩm",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Danh sách sản phẩm (đã lọc)
            Expanded(
              child: ListView.builder(
                itemCount: _danhSachSP1.length,
                itemBuilder: (context, index) {
                  final sp = _danhSachSP1[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      title: Text(
                        sp.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4),
                          Text("Mã: ${sp.code}"),
                          Text("SL tổng: ${sp.soLuong}"),
                          Text("🔹 Hạn sử dụng: ${sp.hanSuDung}"),
                          Text("🔹 Đã dùng: ${sp.soDaDung}"),
                          Text("🔹 Còn lại: ${sp.soConLai}"),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          // Khi xóa, phải tìm vị trí trong _danhSachSP gốc
                          final originalIndex =
                              _danhSachSP.indexOf(_danhSachSP1[index]);
                          _deleteSP(originalIndex);
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Nút thêm sản phẩm mới
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddSPDialog,
        backgroundColor: Colors.green,
        child: Icon(Icons.add, color: Colors.white),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
       items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Tổng Quan"),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2), label: "Kho"),
          BottomNavigationBarItem(
              icon: Icon(Icons.upload), label: "Nhập hàng"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Nhân viên'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: 'Khách hàng'),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (value) {},
      ),
    );
  }
}
