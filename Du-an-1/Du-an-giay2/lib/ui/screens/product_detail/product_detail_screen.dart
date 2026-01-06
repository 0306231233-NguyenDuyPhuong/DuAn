import 'package:coffee_shop_test/data/models/product.dart';
import 'package:coffee_shop_test/data/models/product_image.dart';
import 'package:coffee_shop_test/data/services/cart_item_service.dart';
import 'package:coffee_shop_test/data/viewmodels/product_image_viewmodels.dart';
import 'package:coffee_shop_test/data/viewmodels/product_varinat_values_service.dart';
import 'package:coffee_shop_test/data/viewmodels/variant_value_viewmodels.dart';
import 'package:coffee_shop_test/data/viewmodels/wish_viewmodels.dart';
import 'package:coffee_shop_test/ui/screens/cart/cart_screen.dart';
import 'package:coffee_shop_test/ui/screens/feedback/feed_back_screen.dart';
import 'package:coffee_shop_test/ui/screens/product_detail/product_image_list.dart';
import 'package:coffee_shop_test/ui/screens/product_detail/variant_value_color_list.dart';
import 'package:coffee_shop_test/ui/screens/product_detail/variant_value_size_list.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../data/models/product_variant_value.dart';
import '../../shared/widget/TCirilerText.dart';
import '../../shared/widget/container_vorcher.dart';
import '../../shared/widget/my_button.dart';
import '../../shared/widget/my_icon_button.dart';
import '../../shared/widget/my_image.dart';
import '../../shared/widget/my_text.dart';
import '../order_review/order_review_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final int product_id;
  final String token;
  final productData;
  final int user_id;
  const ProductDetailScreen({
    super.key,
    required this.product_id,
    required this.productData,
    required this.token,
    required this.user_id,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetailScreen> {
  final ProductImageViewModel productImageViewModel = ProductImageViewModel();
  final ProductVariantValuesViewModel productVariantValuesViewModel =
      ProductVariantValuesViewModel();
  final VariantValueViewModel variantValueViewModel = VariantValueViewModel();
  final WishViewModel wishViewModel = WishViewModel();
  ProductVariantValue? productVariant;
  late Future<Map<String, dynamic>> _loadProductDetail;

  Future<Map<String, dynamic>> fechAllDataProductDetail() async {
    final result = await Future.wait([
      productImageViewModel.getProductImageById(
        widget.token,
        widget.product_id,
      ),
      productVariantValuesViewModel.getProductVariantValueById(
        widget.token,
        widget.product_id,
      ),
      variantValueViewModel.getVariantValues(widget.token),
      wishViewModel.loadWishById(widget.product_id),
    ]);
    return {
      'product_images': result[0],
      'product_variant_value': result[1],
      'variant_values': result[2],
      'wish': result[3],
    };
  }

  void loadSku(String sku) async {
    try {
      final data = await productVariantValuesViewModel
          .getProductVariantValueBySku(sku);

      setState(() {
        productVariant = data;
      });
    } catch (e) {
      throw Exception(e);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadProductDetail = fechAllDataProductDetail();
  }

  CartItemService cartItemService = CartItemService();
  late NameProduct listNameProduct;
  String? color;
  String size = "";
  bool isCheck = false;
  int? isSelectedIndex;
  int? isSelectedIndexColor;
  int? isSelectedIndexSize;
  bool checkSize = false;
  bool checkColor = false;
  int quantity = 1;
  late String imageProduct;

  bool kiemTra(String isColor, String isSize) {
    if (isColor.isNotEmpty && isSize.isNotEmpty)
      return true;
    else
      return false;
  }

  var idColors = "";
  var idSize = "";
  var sku = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _loadProductDetail,
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
                return Center(child: Text("${snapshot.error}"));
              }
              final product_image = snapshot.data!["product_images"]["product_images"];
              final product_variant_value = snapshot.data!["product_variant_value"]["product_variant_value"]["data"];
              final variant_value = snapshot.data!["variant_values"]["variant_value"]["data"];
              final products = widget.productData;
              final wish = snapshot.data!["wish"];
              imageProduct = products["image"];
              // isCheck = wish[0].status;

              final variant_color = variant_value
                  .where((item) => item['variant_id'] == 3)
                  .toList();
              final variant_size = variant_value
                  .where((item) => item['variant_id'] == 4)
                  .toList();

              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
                child: StatefulBuilder(
                  builder: (context, setItemState) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyIconButton(
                                handler: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Iconsax.arrow_left,
                                  weight: 2,
                                  size: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              MyIconButton(
                                handler: () {
                                  setItemState(() {
                                    isCheck = !isCheck;

                                  });
                                },
                                icon: Icon(
                                  Iconsax.heart5,
                                  weight: 2,
                                  size: 30,
                                  color: isCheck ? Colors.red : Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          //Image product
                          Container(
                            height: 350,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.03),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Positioned(
                                    child: GestureDetector(
                                      onTap: (){
                                        showDialog(context: context, builder: (context){
                                          return AlertDialog(
                                            title: MyImage(
                                              width: 350,
                                              height: 350,
                                              url:
                                              "http://10.0.2.2:8989/api/images/${imageProduct}",
                                            ),
                                          );
                                        });
                                      },
                                      child: MyImage(
                                        width: 300,
                                        height: 300,
                                        url:
                                            "http://10.0.2.2:8989/api/images/${imageProduct}",
                                      ),
                                    ),
                                  ),
                                ),
                                //List product image
                                Positioned(
                                  bottom: 10,
                                  child: Container(
                                    height: 100,
                                    width: 400,
                                    child: ProductImageList(
                                      product_image: product_image,
                                      name_image: imageProduct,
                                      onChanged: (String value) {
                                        setItemState((){
                                          imageProduct = value;
                                        });
                                        },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //Overview product
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Rating
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Iconsax.star5,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellow,
                                            size: 30,
                                          ),
                                        ),
                                        MyText(
                                          title: "5 ",
                                          size: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        MyText(
                                          title:
                                              "(${product_variant_value['stock']})",
                                          size: 16,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.share,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //vorcher vs price
                                Row(
                                  children: [
                                    TContainerVorcher(
                                      height: 30,
                                      width: 40,
                                      colorContainer: Colors.yellow.withOpacity(
                                        0.9,
                                      ),
                                      radiuseContainer: 5,
                                      child: Center(
                                        child: MyText(
                                          title: "33%",
                                          size: 15,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      "\$${productVariant?.old_price ?? product_variant_value['old_price']}",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    MyText(
                                      title:
                                          "\$${productVariant?.price ?? product_variant_value['price']}",
                                      size: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),

                                //Name
                                const SizedBox(height: 10),
                                MyText(
                                  title: "${products['name']}",
                                  size: 23,
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const MyText(
                                      title: "Stock: ",
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    MyText(
                                      title:
                                          "${productVariant?.stock ?? product_variant_value["stock"]}",
                                      size: 23,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const SizedBox(width: 5),
                                    MyText(
                                      title: "Nike",
                                      size: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    MyText(
                                      title: "Variation: ",
                                      size: 23,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      children: [
                                        MyText(
                                          title:
                                              "Price: ${productVariant?.price ?? product_variant_value['price']}",
                                          size: 15,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const SizedBox(height: 9),
                                        MyText(
                                          title:
                                              "Stock: ${productVariant?.stock ?? product_variant_value["stock"]}",
                                          size: 15,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const MyText(
                                  title:
                                      "This is a Product description for Green Nike sports shoe.",
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 10),
                                const MyText(
                                  title: "Color",
                                  size: 23,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 10),

                                //list color
                                Container(
                                  height: 50,
                                  child: VariantValueColorList(
                                    list_variant_value_color: variant_color,
                                    id: size,
                                    data: idColors,
                                    onChanged: (String id, String value) {
                                      size = value;
                                      idColors = id;
                                      if (kiemTra(idColors, idSize)) {
                                        final sku = "${idColors}-${idSize}";
                                        loadSku(sku);
                                      } else {

                                      }
                                    },
                                  ),
                                ),

                                const SizedBox(height: 15),
                                const MyText(
                                  title: "Size",
                                  size: 23,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),

                                const SizedBox(height: 10),

                                Container(
                                  height: 50,
                                  child: VariantValueSizeList(
                                    list_variant_size: variant_size,
                                    id: idSize,
                                    data: size,
                                    onChanged: (String id, String value) {
                                      idSize = id;
                                      color = value;
                                      if (kiemTra(idColors, idSize)) {
                                        final sku = "${idColors}-${idSize}";
                                        loadSku(sku);
                                      } else {}
                                    },
                                  ),
                                ),

                                const SizedBox(height: 15),
                                MyButton(
                                  radius: 12,
                                  width: 400,
                                  height: 60,
                                  colorButton: Colors.blueAccent,
                                  handler: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen(user_id: widget.user_id, token: widget.token)));
                                  },
                                  child: MyText(
                                    title: "Checkout",
                                    size: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                MyText(
                                  title: "Description",
                                  size: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 15),
                                MyText(
                                  title: products['description'],
                                  size: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 25),
                                const Divider(color: Colors.grey, thickness: 2),
                                const SizedBox(height: 25),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyText(
                                      title: "Reviews",
                                      size: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    MyIconButton(
                                      handler: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedBackScreen(token: widget.token, product_id: products["id"],)));
                                      },
                                      icon: Icon(
                                        Iconsax.arrow_right_3,
                                        size: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
          }
        },
      ),

      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
        child: Row(
          children: [
            Row(
              children: [
                TCirclerText(
                  width: 40,
                  height: 40,
                  color: Colors.grey,
                  child: Center(
                    child: MyText(title: "-", size: 30, color: Colors.white),
                  ),
                  hanlder: () {
                    setState(() {
                      quantity--;
                      if (quantity < 1) {
                        quantity = 1;
                      }
                    });
                  },
                ),
                TCirclerText(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: MyText(
                      title: "${quantity}",
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  hanlder: () {},
                ),
                TCirclerText(
                  width: 40,
                  height: 40,
                  color: Colors.black,
                  child: Center(
                    child: MyText(title: "+", size: 30, color: Colors.white),
                  ),
                  hanlder: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(width: 100),

            GestureDetector(
              child: Container(
                height: 70,
                width: 160,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Iconsax.shopping_bag, color: Colors.white),
                    const SizedBox(width: 7),
                    MyText(
                      title: "Add to Bag",
                      fontWeight: FontWeight.bold,
                      size: 17,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              onTap: () async {
                final listNameProduct = [
                  NameProduct(color: color.toString(), size: size.toString()),
                ];
                final data = await cartItemService.postCartItem(
                  widget.token,
                  widget.user_id,
                  quantity,
                  listNameProduct,
                  0,
                );

                if (data["status"] == 200) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${data["message"]}"))
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Sản phẩm đã hết hàng"))
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
