import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoodFood App',
      theme: ThemeData(
        primaryColor: Colors.blue[700],
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/Logo.jpg',
            width: 40, // Giảm kích thước logo cho phù hợp
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        title: const Text(
          "GoodFood",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[700]!, Colors.blue[400]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0), // Tăng padding tổng thể
        children: [
          // Thực đơn
          _buildCard(
            icon: Icons.restaurant_menu,
            title: 'Thực đơn',
            subtitle: Row(
              children: [
                Icon(Icons.settings, color: Colors.blue[600], size: 16),
                Text(' Thiết lập giá', style: TextStyle(color: Colors.grey[600])),
                SizedBox(width: 12),
                Icon(Icons.fastfood, color: Colors.green[400], size: 16),
                Text(' ShopeeFood Mới', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
            onTap: () {},
          ),
          SizedBox(height: 16), // Tăng khoảng cách
          // Phòng bán
          _buildCard(
            icon: Icons.store,
            title: 'Phòng bán',
            subtitle: Text('Phong bán', style: TextStyle(color: Colors.grey[600])),
            onTap: () {},
          ),
          SizedBox(height: 16),
          // Hóa đơn
          _buildCard(
            icon: Icons.receipt,
            title: 'Hóa đơn',
            subtitle: Row(
              children: [
                Icon(Icons.description, color: Colors.blue[600], size: 16),
                Text(' Hóa đơn', style: TextStyle(color: Colors.grey[600])),
                SizedBox(width: 12),
                Icon(Icons.refresh, color: Colors.green[400], size: 16),
                Text(' Trả hàng', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
            onTap: () {},
          ),
          SizedBox(height: 16),
          // Kho hàng
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            elevation: 6,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.grey[50]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.inventory, color: Colors.blue[700], size: 28),
                    title: Text('Kho hàng', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text('Hàng hóa', style: TextStyle(color: Colors.grey[600])),
                    trailing: Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: () {},
                  ),
                  Divider(height: 1, indent: 16, endIndent: 16),
                  ListTile(
                    leading: Icon(Icons.delete, color: Colors.red[400], size: 28),
                    title: Text('Xuất hủy', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    trailing: Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: () {},
                  ),
                  Divider(height: 1, indent: 16, endIndent: 16),
                  ListTile(
                    leading: Icon(Icons.add, color: Colors.green[400], size: 28),
                    title: Text('Nhập hàng', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    trailing: Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          // Sổ thu chi
          _buildCard(
            icon: Icons.account_balance_wallet,
            title: 'Sổ thu chi',
            subtitle: Text('Sổ quỹ', style: TextStyle(color: Colors.grey[600])),
            onTap: () {},
          ),
          SizedBox(height: 16),
          // Khách hàng
          _buildCard(
            icon: Icons.people,
            title: 'Khách hàng',
            subtitle: Text('Khách hàng', style: TextStyle(color: Colors.grey[600])),
            onTap: () {},
          ),
          SizedBox(height: 16),
          // Nhân viên
          _buildCard(
            icon: Icons.person,
            title: 'Nhân viên',
            subtitle: Text('Nhân viên', style: TextStyle(color: Colors.grey[600])),
            onTap: () {},
          ),
          SizedBox(height: 16),
          // Báo cáo
          _buildCard(
            icon: Icons.bar_chart,
            title: 'Báo cáo',
            subtitle: Text('Cuối ngày', style: TextStyle(color: Colors.grey[600])),
            onTap: () {},
          ),
          SizedBox(height: 16),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 8,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home, color: Colors.blue[700]),
            label: 'Tổng quan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            activeIcon: Icon(Icons.fastfood, color: Colors.blue[700]),
            label: 'Hàng hóa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            activeIcon: Icon(Icons.receipt, color: Colors.blue[700]),
            label: 'Hóa đơn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            activeIcon: Icon(Icons.account_balance_wallet, color: Colors.blue[700]),
            label: 'Sổ quỹ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            activeIcon: Icon(Icons.menu, color: Colors.blue[700]),
            label: 'Công cụ',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey[600],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        onTap: (index) {},
      ),
      
    );
  }

  // Hàm xây dựng Card tùy chỉnh
  Widget _buildCard({
    required IconData icon,
    required String title,
    required Widget subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 6,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: Icon(icon, color: Colors.blue[700], size: 28),
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: subtitle,
          trailing: Icon(Icons.chevron_right, color: Colors.grey),
          onTap: onTap,
        ),
      ),
    );
  }
}