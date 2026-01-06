import 'package:coffee_shop_test/data/services/order_detail_service.dart';

class OrderDetailViewModel{
  final orderDetailService = OrderDetailService();
  Future<Map<String, dynamic>> getOrderDetail(String token, int order_id)async{
    return orderDetailService.getOrderDetails(token, order_id);
  }
}