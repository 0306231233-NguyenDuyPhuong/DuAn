import 'package:coffee_shop_test/data/services/user_address_service.dart';
import 'package:coffee_shop_test/data/viewmodels/cart_item_viewmodels.dart';
import 'package:coffee_shop_test/data/viewmodels/user_address_viewmodels.dart';
import 'package:coffee_shop_test/ui/screens/cart/cart_list.dart';
import 'package:coffee_shop_test/ui/screens/cart/widgets/list_cart_overview.dart';
import 'package:coffee_shop_test/ui/screens/cart/widgets/payment_success.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/widget/my_button.dart';
import '../../shared/widget/my_image.dart';
import '../../shared/widget/my_text.dart';
import '../cart/TContainerImage.dart';
import '../cart/TContainerName.dart';
import '../from/address_screen.dart';
import 'widgets/subtotal_container.dart';

class OrderReviewScreen extends StatefulWidget {
  final cartItem;
  final int user_id;
  final String token;
  final int subtatal;
  const OrderReviewScreen({super.key, required this.cartItem, required this.user_id, required this.token, required this.subtatal});

  @override
  State<OrderReviewScreen> createState() => _OrderReviewState();
}

class _OrderReviewState extends State<OrderReviewScreen> {
  UserAddressViewmodel userAddressViewmodel = UserAddressViewmodel();
  final txtNoteController = TextEditingController();
  late String address = "";
  final key = UserAddressService.key;

  Future<Map<String, dynamic>> getData()async{
    final result = await Future.wait([
      userAddressViewmodel.getAddress(key)
    ]);
    return {
      "user_address":result[0]
    };
  }
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          title: "Order review",
          size: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: FutureBuilder(future: getData(), builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          // TODO: Handle this case.
            throw UnimplementedError();
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          // TODO: Handle this case.
            throw UnimplementedError();
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
            print(snapshot.data);
            final user_address = snapshot.data!['user_address'];
            print(user_address);
            address =
            "${user_address['full_name']}, ${user_address['phone']}, ${user_address['address']}";
            return SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      //List view
                      Container(
                        height: 250,
                        child: ListCartOverview(cartItems: widget.cartItem,
                          user_id: widget.user_id,
                          token: widget.token,
                          onChanged: (int p1) {},),
                      ),
                      //Giảm gía
                      Container(
                          height: 80,
                          width: 390,
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.grey,
                                  width: 1
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 70,
                                width: 260,
                                margin: EdgeInsets.only(top: 14),
                                decoration: BoxDecoration(
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hint: Text(
                                        "Have a promo code? Enter here",
                                        style: const TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),)
                                  ),
                                  controller: txtNoteController,
                                ),
                              ),
                              Container(
                                height: 60,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: Center(child: Text("Apply",
                                  style: const TextStyle(fontSize: 20,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),)),
                              ),
                            ],
                          )
                      ),
                      const SizedBox(height: 25),
                      //Order
                      Container(
                        width: 390,
                        padding: EdgeInsets.only(top: 10, left: 16, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            //price
                            SubtotalContainer(subtatol: widget.subtatal,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Container(
                                  width: 370, height: 2, color: Colors.grey),
                            ),
                            //payment
                            Column(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    MyText(
                                      title: "Payment Method",
                                      size: 23,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    MyText(
                                      title: "Change",
                                      size: 15,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 100,
                                  child: ListView.builder(
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 16,
                                                right: 16,
                                              ),
                                              child: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                  borderRadius: BorderRadius
                                                      .circular(400),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      5.0),
                                                  child: Image.asset(
                                                    width: 70,
                                                    height: 70,
                                                    "assets/images/logo_momo.png",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            MyText(title: "Momo",
                                                size: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87)
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            //add ress
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    const MyText(
                                      title: "Shipping Address",
                                      size: 23,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    InkWell(
                                      onTap: () async{
                                       final result = await Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddressScreen(
                                                      token: widget.token,
                                                      user_id: widget
                                                          .user_id,)));
                                       if(result){
                                          userAddressViewmodel.getAddress(key);
                                          setState(() {
                                          });
                                       }
                                      },
                                      child: MyText(
                                        title: "Change",
                                        size: 15,
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Container(
                                  //height: 80,
                                  width: 400,
                                  child: Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        MyText(
                                          title: "${user_address['full_name']}",
                                          size: 20,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,),
                                        const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Icon(Iconsax.call),
                                            const SizedBox(width: 20,),
                                            MyText(
                                              title: "${user_address['phone']}",
                                              size: 15,
                                              color: Colors.grey,),
                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                        MyText(
                                          title: "${user_address['address']}",
                                          size: 15,
                                          color: Colors.grey,
                                          maxlines: 2,),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
        }
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: MyButton(
          radius: 12,
          width: 290,
          height: 70,
          colorButton: Colors.blueAccent,
          child: MyText(
            title: "Checkout \$${widget.subtatal}",
            size: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          handler: () async{
            int user_id = widget.user_id;
            int pay_id = 1;
            int shipper_id = 1;
            String shipping_address =address;
            int total = widget.subtatal;
            String note = txtNoteController.text;


            CartItemViewmodels cartItemViewmodels = CartItemViewmodels();
            final result = await cartItemViewmodels.postCheckoutCart(widget.token, user_id, pay_id, shipper_id, shipping_address, total, note);
            print(result);

            setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentSuccess()));
              });
          },
        ),
      ),
    );
  }
}