import 'package:coffee_shop_test/data/services/order_service.dart';
import 'package:http/http.dart' as http;

class OrderViewModel{
  OrderService orderService = OrderService();
  Future<Map<String, dynamic>> getOrders(String token) async{
    final data = await orderService.getOrders(token);
    return {
      "orders":data
    };
  }
}