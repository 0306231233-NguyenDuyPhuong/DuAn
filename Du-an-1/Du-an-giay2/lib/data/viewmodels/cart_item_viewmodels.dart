import 'package:coffee_shop_test/data/models/cart_item.dart';
import 'package:coffee_shop_test/data/services/cart_item_service.dart';

class CartItemViewmodels {
  final CartItemService cartItemService = CartItemService();
  Future<Map<String, dynamic>> getCartItemByUserId(
    String token,
    int user_id,
  ) async {
    final data = await cartItemService.getCartItemByUserId(token, user_id);
    return {"carts": data};
  }

  Future<Map<String, dynamic>> postCartItem(
    String token,
    int user_id,
    int quantity,
    List<NameProduct>? nameProduct,
    int? product_variant_id,
  ) {
    try {
      final data = cartItemService.postCartItem(
        token,
        user_id,
        quantity,
        nameProduct,
        product_variant_id,
      );
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> postCheckoutCart(
    String token,
    int user_id,
    int pay_id,
    int shipper_id,
    String shipping_address,
    int total,
    String note,
  ) {
    try {
      final data = cartItemService.postCheckoutCart(
        token,
        user_id,
        pay_id,
        shipper_id,
        shipping_address,
        total,
        note,
      );
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  int calculateTotalPrice(final carts) {
    return carts.fold(
      0,
      (sum, cart) =>
          sum +
          int.parse(cart['product_variant_value']['price']) * cart['quantity'],
    );
  }
}
