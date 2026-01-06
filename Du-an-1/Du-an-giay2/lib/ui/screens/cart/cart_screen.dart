import 'package:coffee_shop_test/data/viewmodels/cart_item_viewmodels.dart';
import 'package:coffee_shop_test/data/viewmodels/product_varinat_values_service.dart';
import 'package:coffee_shop_test/ui/screens/cart/cart_list.dart';
import 'package:coffee_shop_test/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../shared/widget/my_button.dart';
import '../../shared/widget/my_text.dart';
import '../order_review/order_review_screen.dart';

class CartScreen extends StatefulWidget {
  final int user_id;
  final String token;
  const CartScreen({super.key, required this.user_id, required this.token});

  @override
  State<CartScreen> createState() => _CartState();
}

class _CartState extends State<CartScreen> {
  final CartItemViewmodels cartItemViewmodels = CartItemViewmodels();
  final ProductVariantValuesViewModel productVariantValuesViewModel =
      ProductVariantValuesViewModel();
  late Future<Map<String, dynamic>> _futureData;

  Future<Map<String, dynamic>> fetchAllDataCart() async {
    final result = await Future.wait([
      cartItemViewmodels.getCartItemByUserId(widget.token, widget.user_id),
    ]);
    return {'cartItems': result[0]};
  }

  @override
  void initState() {
    super.initState();
    _futureData = fetchAllDataCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          title: "Cart",
          size: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: FutureBuilder(
        future: _futureData,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              throw UnimplementedError();
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              // TODO: Handle this case.
              throw UnimplementedError();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: MyText(
                    title: "${snapshot.error}",
                    size: 20,
                    color: Colors.black,
                  ),
                );
              }
              final cartItems = snapshot.data!['cartItems']["carts"];
              var totalPrice = cartItemViewmodels.calculateTotalPrice(
                cartItems["data"],
              );
              return Column(
                children: [
                  Container(
                    height: 700,
                    decoration: BoxDecoration(),
                    child: CartList(
                      cartItems: cartItems,
                      user_id: widget.user_id,
                      token: widget.token,
                      onChanged: (int quantity) {
                        setState(() {
                          totalPrice = cartItemViewmodels.calculateTotalPrice(
                            cartItems["data"],
                          );
                        });
                      },
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      child: MyButton(
                        radius: 12,
                        width: 280,
                        height: 60,
                        colorButton: Colors.blueAccent,
                        handler: () {
                          if(cartItems['data'].isEmpty){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(token: widget.token)));
                          }else{
                            print(cartItems);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderReviewScreen(
                                  cartItem: cartItems,
                                  user_id: widget.user_id,
                                  token: widget.token, subtatal: totalPrice,
                                ),
                              ),
                            );
                          }
                        },
                        child: MyText(
                          title: cartItems["data"].isEmpty?"Mua hàng ngay":"Checkout \$${totalPrice}",
                          size: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
