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
      home: CongCu(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CongCu extends StatefulWidget {
  const CongCu({super.key});

  @override
  _CongCu createState() => _CongCu();
}

class _CongCu extends State<CongCu> {
  String _selectedLanguage = 'Tiếng Việt';

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String tempSelected = _selectedLanguage;
        return AlertDialog(
          title: Text('Chọn ngôn ngữ'),
          content: StatefulBuilder(
            builder: (context, setDialogState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: Text('Tiếng Việt'),
                    value: 'Tiếng Việt',
                    groupValue: tempSelected,
                    onChanged: (value) {
                      setDialogState(() {
                        tempSelected = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('English'),
                    value: 'English',
                    groupValue: tempSelected,
                    onChanged: (value) {
                      setDialogState(() {
                        tempSelected = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('日本語'),
                    value: '日本語',
                    groupValue: tempSelected,
                    onChanged: (value) {
                      setDialogState(() {
                        tempSelected = value!;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedLanguage = tempSelected;
                });
                Navigator.pop(context);
              },
              child: Text('Lưu'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/Logo.jpg',
            width: 40,
            height: 40,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.storefront, color: Colors.white, size: 32);
            },
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
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        children: [
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
          SizedBox(height: 16),
          _buildCard(
            icon: Icons.store,
            title: 'Phòng bán',
            subtitle: Text('Phòng bán', style: TextStyle(color: Colors.grey[600])),
            onTap: () {},
          ),
          SizedBox(height: 16),
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
          _buildCard(
            icon: Icons.account_balance_wallet,
            title: 'Sổ thu chi',
            subtitle: Text('Sổ quỹ', style: TextStyle(color: Colors.grey[600])),
            onTap: () {},
          ),
          SizedBox(height: 16),
          _buildCard(
            icon: Icons.people,
            title: 'Khách hàng',
            subtitle: Text('Khách hàng', style: TextStyle(color: Colors.grey[600])),
            onTap: () {},
          ),
          SizedBox(height: 16),
          _buildCard(
            icon: Icons.person,
            title: 'Nhân viên',
            subtitle: Text('Nhân viên', style: TextStyle(color: Colors.grey[600])),
            onTap: () {},
          ),
          SizedBox(height: 16),
          _buildCard(
            icon: Icons.bar_chart,
            title: 'Báo cáo',
            subtitle: Text('Cuối ngày', style: TextStyle(color: Colors.grey[600])),
            onTap: () {},
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
            child: Text(
              'CÀI ĐẶT CHUNG',
              style: TextStyle(fontSize: 14, color: Colors.grey[700], fontWeight: FontWeight.w600, letterSpacing: 1.0),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            elevation: 2,
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                _buildSettingsTile(
                  icon: Icons.storefront_outlined,
                  text: 'Thiết lập cửa hàng',
                  onTap: () {},
                ),
                _buildSettingsDivider(),
                _buildSettingsTile(
                  icon: Icons.settings_outlined,
                  text: 'Thiết lập ứng dụng & thiết bị',
                  onTap: () {},
                ),
                _buildSettingsDivider(),
                _buildSettingsTile(
                  icon: Icons.person_outline,
                  text: 'Quản lý người dùng',
                  onTap: () {},
                ),
                _buildSettingsDivider(),
                _buildSettingsTile(
                  icon: Icons.history,
                  text: 'Lịch sử thao tác',
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
            child: Text(
              'HỖ TRỢ',
              style: TextStyle(fontSize: 14, color: Colors.grey[700], fontWeight: FontWeight.w600, letterSpacing: 1.0),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            elevation: 2,
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                _buildSettingsTile(
                  icon: Icons.help_outline,
                  text: 'Hướng dẫn sử dụng',
                  onTap: () {},
                ),
                _buildSettingsDivider(),
                _buildSettingsTile(
                  icon: Icons.chat_bubble_outline,
                  text: 'Chat với nhân viên hỗ trợ',
                  onTap: () {},
                ),
                _buildSettingsDivider(),
                _buildSettingsTile(
                  icon: Icons.phone_in_talk_outlined,
                  text: 'Gọi tổng đài 1900 6522',
                  onTap: () {},
                ),
                _buildSettingsDivider(),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  leading: Icon(Icons.language, color: Colors.black87),
                  title: Text(
                    'Ngôn ngữ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(_selectedLanguage, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                  onTap: _showLanguageDialog,
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            elevation: 2,
            margin: EdgeInsets.zero,
            child: _buildSettingsTile(
              icon: Icons.logout,
              text: 'Đăng xuất',
              iconColor: Colors.redAccent,
              textColor: Colors.redAccent,
              onTap: () {},
            ),
          ),
          SizedBox(height: 24),
          Center(
            child: Text(
              'Phiên bản 25.5.1',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

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

  Widget _buildSettingsTile({
    required IconData icon,
    required String text,
    Color iconColor = Colors.black87,
    Color textColor = Colors.black87,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Icon(icon, color: iconColor),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildSettingsDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 56.0),
      child: Divider(height: 1, color: Colors.grey[300]),
    );
  }
}
