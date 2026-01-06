import 'package:coffee_shop_test/data/viewmodels/product_viewmodels.dart';
import 'package:coffee_shop_test/data/viewmodels/wish_viewmodels.dart';
import 'package:coffee_shop_test/ui/screens/product_detail/product_detail_screen.dart';
import 'package:coffee_shop_test/ui/shared/widget/container_bottom.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/widget/container_vorcher.dart';
import '../../shared/widget/my_text.dart';

class WishScreen extends StatefulWidget {
  final String token;
  final int user_id;
  const WishScreen({super.key, required this.token, required this.user_id});

  @override
  State<WishScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishScreen> {
  WishViewModel wishViewModel = WishViewModel();
  late bool isCheck;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Wish",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: FutureBuilder(
        future: wishViewModel.loadWishList(),
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
              final data = snapshot.data!;
              return GridView.builder(
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 320,
                ),
                itemBuilder: (context, index) {
                  final item = data[index];
                  isCheck = item.status;
                  return StatefulBuilder(
                    builder: (context, setItemState) {
                      return GestureDetector(
                        onTap: () async{
                          ProductViewModel productViewModel = ProductViewModel();
                          final productData = await productViewModel.getProductById(widget.token,item.product_id);
                          print(productData);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                product_id: item.product_id,
                                productData: productData["product"]["data"],
                                token: widget.token,
                                user_id: widget.user_id,
                              ),
                            ),
                          );

                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TContainerVorcher(
                                      height: 30,
                                      width: 40,
                                      colorContainer: Colors.yellow,
                                      radiuseContainer: 5,
                                      child: Center(
                                        child: MyText(
                                          title: "78%",
                                          size: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          setItemState(() {
                                            isCheck = !isCheck;
                                          });
                                          if (isCheck == false) {
                                            //final wish = Wish(widget.user_id, item['id'], item["image"], item['name'], "nike", 0, 0, isCheck);
                                            wishViewModel.deleteWish(
                                              item.product_id,
                                            );
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "Xóa thành công!",
                                                ),
                                              ),
                                            );
                                            setState(() {});
                                          } else {}
                                        },
                                        icon: Icon(
                                          Iconsax.heart5,
                                          size: 24,
                                          color: isCheck
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Product Image (bỏ padding thừa)
                              Expanded(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      height: 150,
                                      "http://10.0.2.2:8989/api/images/${item.image}",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              // Product info
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      title: "${item.name}",
                                      size: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45,
                                    ),
                                    MyText(
                                      title: "Nike",
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyText(
                                          title: "122.6-334.0",
                                          size: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  bottomRight: Radius.circular(
                                                    12,
                                                  ),
                                                ),
                                            color: Colors.blueAccent,
                                          ),
                                          child: const Center(
                                            child: MyText(
                                              title: "1",
                                              size: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
          }
        },
      ),
      bottomNavigationBar: ContainerBottom(token: widget.token),
    );
  }
}
