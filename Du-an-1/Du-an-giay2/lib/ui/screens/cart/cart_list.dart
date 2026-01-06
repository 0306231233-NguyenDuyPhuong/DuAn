import 'package:coffee_shop_test/data/viewmodels/cart_item_viewmodels.dart';
import 'package:coffee_shop_test/ui/shared/widget/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../data/services/cart_item_service.dart';
import '../../../data/viewmodels/product_viewmodels.dart';
import '../../shared/widget/TCirilerText.dart';
import '../../shared/widget/my_image.dart';
import '../../shared/widget/my_text.dart';
import '../product_detail/product_detail_screen.dart';

class CartList extends StatefulWidget {
  final cartItems;
  final int user_id;
  final String token;
  final Function(int) onChanged;
  const CartList({super.key, required this.cartItems, required this.user_id, required this.token, required this.onChanged});

  @override
  State<CartList> createState() => _ListCartItemState();
}

class _ListCartItemState extends State<CartList> {
  final txtQuantityController = TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.cartItems["data"].length,
      itemBuilder: (context, index) {
        final cart = widget.cartItems["data"][index];
        final productVariantValue = cart['product_variant_value'];
        final product = productVariantValue['product'];

        return GestureDetector(
          onTap: ()async{
            ProductViewModel productViewModel = ProductViewModel();
            final productData = await productViewModel.getProductById(widget.token,product["id"]);
            print(productData);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                  product_id: product["id"],
                  productData: productData["product"]["data"],
                  token: widget.token,
                  user_id: widget.user_id,
                ),
              ),
            );
          },
          child: Container(
            height: 150,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Image
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: MyImage(
                        width: 70,
                        height: 70,
                        url:
                        "http://10.0.2.2:8989/api/images/${product['image']}",
                      ),
                    ),
                  ),
                ),
                //Titile
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                title: "Nike",
                                size: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.withOpacity(0.6),
                              ),
                              MyText(
                                title:
                                "${product['name']}",
                                size: 17,
                                color: Colors.black.withOpacity(0.7),
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          
                          IconButton(onPressed: (){
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: Text("Do you want remove product?"),
                                actions: [
                                  Row(
                                    children: [
                                      ElevatedButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: Text("No")),
                                      ElevatedButton(onPressed: ()async{
                                        widget.cartItems["data"].removeAt(index);
                                        setState(() {

                                        });
                                        CartItemViewmodels cartViewModel = CartItemViewmodels();
                                        final listNameProduct = [ NameProduct(color: "", size: "") ];

                                        await cartViewModel.postCartItem(
                                          widget.token,
                                          widget.user_id,
                                          0,
                                          listNameProduct,
                                          cart["product_variant_id"],
                                        );
                                        Navigator.pop(context);
                                        MySnackbar().showSnackbar(context, "Delete product success");
                                      }, child: Text("Ok")),
                                    ],
                                  )
                                ],
                              );
                            });
                          }, icon: Icon(Icons.delete_forever, color: Colors.red,size: 25,))
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    Container(
                      child: Row(
                        children: [
                          Row(
                            children: [
                              TCirclerText(
                                width: 40,
                                height: 40,
                                color: Colors.grey.withOpacity(0.1),
                                child: Center(
                                  child: MyText(
                                    title: "-",
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                                hanlder: () async {
                                  int currentQty = widget.cartItems["data"][index]["quantity"];
                                  setState(() {
                                    if (currentQty > 1) {
                                      widget.cartItems["data"][index]["quantity"] = currentQty - 1;
                                    } else {
                                      showDialog(context: context, builder: (context){
                                        return AlertDialog(
                                          title: Text("Do you want remove product?"),
                                          actions: [
                                            Row(
                                              children: [
                                                ElevatedButton(onPressed: (){
                                                  Navigator.pop(context);
                                                }, child: Text("No")),
                                                ElevatedButton(onPressed: ()async{
                                                  widget.cartItems["data"].removeAt(index);
                                                  widget.onChanged(
                                                      currentQty > 1 ? currentQty - 1 : 0
                                                  );

                                                  CartItemViewmodels cartViewModel = CartItemViewmodels();
                                                  final listNameProduct = [ NameProduct(color: "", size: "") ];

                                                  await cartViewModel.postCartItem(
                                                    widget.token,
                                                    widget.user_id,
                                                    currentQty > 1 ? currentQty - 1 : 0,
                                                    listNameProduct,
                                                    cart["product_variant_id"],
                                                  );
                                                  Navigator.pop(context);

                                                  MySnackbar().showSnackbar(context, "Delete product success");
                                                }, child: Text("Ok")),
                                              ],
                                            )
                                          ],
                                        );
                                      });
                                    }
                                  });

                                },
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 5, right: 5),
                                child: MyText(
                                  title: "${cart['quantity']}",
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),

                              TCirclerText(
                                width: 40,
                                height: 40,
                                color: Colors.blueAccent,
                                child: Center(
                                  child: MyText(
                                    title: "+",
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                hanlder: ()async{
                                  setState(() {
                                    int currentQty = widget.cartItems["data"][index]["quantity"];
                                      widget.cartItems["data"][index]["quantity"] = currentQty + 1;
                                  });

                                  widget.onChanged(widget.cartItems["data"][index]["quantity"]);

                                  CartItemViewmodels cartViewModel = CartItemViewmodels();
                                  int quantity = widget.cartItems["data"][index]["quantity"];

                                 final listNameProduct = [
                                    NameProduct(color: "", size: ""),
                                  ];
                                  await cartViewModel.postCartItem(widget.token, widget.user_id, quantity,listNameProduct, cart["product_variant_id"]);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(width: 100),
                          MyText(
                            title: "\$${productVariantValue['price']}",
                            size: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
