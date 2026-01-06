import 'package:coffee_shop_test/data/models/wish.dart';
import 'package:coffee_shop_test/data/viewmodels/wish_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../shared/widget/container_vorcher.dart';
import '../../../shared/widget/my_text.dart';
import '../../product_detail/product_detail_screen.dart';

class ProductGridview extends StatefulWidget {
  final Future<Map<String, dynamic>> productsFuture;
  final String token;
  final int user_id;
  final wish;
  const ProductGridview({super.key, required this.productsFuture, required this.token, required this.user_id, this.wish});
  @override
  State<ProductGridview> createState() => _TproductState();
}

class _TproductState extends State<ProductGridview> {
  WishViewModel wishViewModel = WishViewModel();
  bool isCheck = false;

  Future<Map<String, dynamic>> fetchData()async{
    final result = await Future.wait([
      widget.productsFuture,
      wishViewModel.loadWishList()
    ]);
    return {
      "product":result[0],
      "wish":result[1]
    };
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: fetchData(), builder: (context, snapshot){
      switch(snapshot.connectionState) {
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
          if(snapshot.hasError){
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          final product = snapshot.data!['product']["product"];
          final wish = snapshot.data!["wish"].map((item)=>item.product_id);

          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: product["data"].length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 320
            ),
            itemBuilder: (context, index) {
              final item = product["data"][index];
              final status = wish.contains(item["id"]);
              return StatefulBuilder(
                  builder: (context, setItemState){
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              product_id: item["id"],
                              productData: item,
                              token: widget.token, user_id: widget.user_id,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TContainerVorcher(
                                    height: 30,
                                    width: 40,
                                    colorContainer: Colors.yellow,
                                    radiuseContainer: 5,
                                    child:  Center(
                                      child:const MyText(
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
                                      borderRadius:  BorderRadius.circular(50),
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        setItemState((){
                                          isCheck = !isCheck;
                                          if(isCheck){
                                            final wish = Wish(widget.user_id, item['id'], item["image"], item['name'], "nike", 0, 0, isCheck);
                                            wishViewModel.addWish(wish);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: const Text("Thêm thành công!"),
                                              ),
                                            );

                                          }else{
                                            wishViewModel.deleteWish(item["id"]);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content:const Text("Xóa thành công!"),
                                              ),
                                            );
                                          }

                                          setState(() {
                                          });
                                        });
                                      },
                                      icon: Icon(
                                        Iconsax.heart5,
                                        size: 24,
                                        color: status?Colors.red : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Product Image (bỏ padding thừa)
                            SizedBox(
                              height: 160,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    height: 150,
                                    "http://10.0.2.2:8989/api/images/${item["image"]}",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                            ),
                            // Product info
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    title: "${item["name"]}",
                                    size: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                  ),
                                  MyText(
                                    title: "${item["brand"]["name"]}",
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                     const MyText(
                                        title: "122.6-334.0",
                                        size: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                          ),
                                          color: Colors.blueAccent,
                                        ),
                                        child: const Center(
                                          child:const MyText(
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
                  }
              );
            },
          );
      }
    });
  }
}

/**/
