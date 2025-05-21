class QuanLyData {
  Map<String, dynamic> _data = {
    'orders': '0 hóa đơn',
    'servingOrders': '0 đơn đang phục vụ',
    'tables': '0 bàn đang sử dụng',
    'guests': '0 khách đang phục vụ',
    'inventoryTotal': '0',
    'inventoryQuantity': '0',
    'cancelItems': [
      {'title': 'Hủy món sau khi báo bếp', 'percentage': '0% doanh thu', 'quantity': '0 món', 'revenue': '0'},
      {'title': 'Hủy món sau khi đã in hóa đơn', 'percentage': '0% doanh thu', 'quantity': '0 món', 'revenue': '0'},
      {'title': 'Hủy món sau khi giao hàng', 'percentage': '0% doanh thu', 'quantity': '0 món', 'revenue': '0'},
    ],
  };

  Map<String, dynamic> get data => _data;

  void updateData(String selectedValue) {
    switch (selectedValue) {
      case 'Hôm nay':
        _data = {
          'orders': '0 hóa đơn',
          'servingOrders': '0 đơn đang phục vụ',
          'tables': '0 bàn đang sử dụng',
          'guests': '0 khách đang phục vụ',
          'inventoryTotal': '0',
          'inventoryQuantity': '0',
          'cancelItems': [
            {'title': 'Hủy món sau khi báo bếp', 'percentage': '0% doanh thu', 'quantity': '0 món', 'revenue': '0'},
            {'title': 'Hủy món sau khi đã in hóa đơn', 'percentage': '0% doanh thu', 'quantity': '0 món', 'revenue': '0'},
            {'title': 'Hủy món sau khi giao hàng', 'percentage': '0% doanh thu', 'quantity': '0 món', 'revenue': '0'},
          ],
        };
        break;
      case 'Hôm qua':
        _data = {
          'orders': '10 hóa đơn',
          'servingOrders': '0 đơn đang phục vụ',
          'tables': '0 bàn đang sử dụng',
          'guests': '0 khách đang phục vụ',
          'inventoryTotal': '1,200,000',
          'inventoryQuantity': '50',
          'cancelItems': [
            {'title': 'Hủy món sau khi báo bếp', 'percentage': '5% doanh thu', 'quantity': '2 món', 'revenue': '50,000'},
            {'title': 'Hủy món sau khi đã in hóa đơn', 'percentage': '2% doanh thu', 'quantity': '1 món', 'revenue': '20,000'},
            {'title': 'Hủy món sau khi giao hàng', 'percentage': '0% doanh thu', 'quantity': '0 món', 'revenue': '0'},
          ],
        };
        break;
      case '7 ngày gần đây':
        _data = {
          'orders': '20 hóa đơn',
          'servingOrders': '0 đơn đang phục vụ',
          'tables': '0 bàn đang sử dụng',
          'guests': '0 khách đang phục vụ',
          'inventoryTotal': '5,000,000',
          'inventoryQuantity': '200',
          'cancelItems': [
            {'title': 'Hủy món sau khi báo bếp', 'percentage': '8% doanh thu', 'quantity': '5 món', 'revenue': '150,000'},
            {'title': 'Hủy món sau khi đã in hóa đơn', 'percentage': '3% doanh thu', 'quantity': '3 món', 'revenue': '90,000'},
            {'title': 'Hủy món sau khi giao hàng', 'percentage': '1% doanh thu', 'quantity': '1 món', 'revenue': '10,000'},
          ],
        };
        break;
      case 'Tháng này':
        _data = {
          'orders': '50 hóa đơn',
          'servingOrders': '0 đơn đang phục vụ',
          'tables': '0 bàn đang sử dụng',
          'guests': '0 khách đang phục vụ',
          'inventoryTotal': '10,000,000',
          'inventoryQuantity': '500',
          'cancelItems': [
            {'title': 'Hủy món sau khi báo bếp', 'percentage': '10% doanh thu', 'quantity': '10 món', 'revenue': '300,000'},
            {'title': 'Hủy món sau khi đã in hóa đơn', 'percentage': '5% doanh thu', 'quantity': '5 món', 'revenue': '150,000'},
            {'title': 'Hủy món sau khi giao hàng', 'percentage': '2% doanh thu', 'quantity': '2 món', 'revenue': '20,000'},
          ],
        };
        break;
      case 'Tháng trước':
        _data = {
          'orders': '40 hóa đơn',
          'servingOrders': '0 đơn đang phục vụ',
          'tables': '0 bàn đang sử dụng',
          'guests': '0 khách đang phục vụ',
          'inventoryTotal': '8,000,000',
          'inventoryQuantity': '400',
          'cancelItems': [
            {'title': 'Hủy món sau khi báo bếp', 'percentage': '7% doanh thu', 'quantity': '7 món', 'revenue': '200,000'},
            {'title': 'Hủy món sau khi đã in hóa đơn', 'percentage': '4% doanh thu', 'quantity': '4 món', 'revenue': '100,000'},
            {'title': 'Hủy món sau khi giao hàng', 'percentage': '1% doanh thu', 'quantity': '1 món', 'revenue': '10,000'},
          ],
        };
        break;
    }
  }
}