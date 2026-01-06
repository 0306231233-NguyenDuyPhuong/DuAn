import 'package:coffee_shop_test/data/viewmodels/home_viewmodels.dart';
import 'package:coffee_shop_test/data/viewmodels/product_viewmodels.dart';
import 'package:coffee_shop_test/ui/screens/home/widgets/home_appbar.dart';
import 'package:coffee_shop_test/ui/screens/home/widgets/search_container.dart';
import 'package:coffee_shop_test/ui/screens/home/widgets/product_gridview.dart';
import 'package:coffee_shop_test/ui/screens/home/widgets/body_search.dart';
import 'package:flutter/material.dart';
import '../../shared/constants/list_category.dart';
import '../../shared/widget/container_bottom.dart';
import 'widgets/banner_list.dart';
import 'widgets/product_title.dart';
import '../../shared/widget/TCirlerContainer.dart';
import '../cart/cart_screen.dart';
import 'widgets/body_title_category.dart';

class HomeScreen extends StatefulWidget {
  final String token;
  const HomeScreen({super.key, required this.token});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  late Future<Map<String, dynamic>> fechAllDataHome;
  late Future<Map<String, dynamic>> fechAllProducts;
  final txtSearchController = TextEditingController();
  HomeViewModel homeViewModel = HomeViewModel();
  ProductViewModel productViewModel = ProductViewModel();
  int category_id = -1;
  int selectedIndexPage = 1;
  String search = "";

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    fechAllDataHome = homeViewModel.fechAllDataHome(widget.token, category_id);
    fechAllProducts = productViewModel.getProduct(widget.token, category_id, selectedIndexPage, "");
  }

  Widget build(BuildContext context) {
    TextEditingController txtSearchController = TextEditingController();
    late int user_id;

    return Scaffold(
      body: FutureBuilder(
        future: fechAllDataHome,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.none:
            // TODO: Handle this case.
              throw UnimplementedError();
            case ConnectionState.active:
            // TODO: Handle this case.
              throw UnimplementedError();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
              final user = snapshot.data!["users"]["user"]["data"];
              user_id = user["id"];
              final category = snapshot.data!["categories"]["category"];
              final banner = snapshot.data!["banners"]["banner"];
              final wish = snapshot.data!["wishs"];

              return Stack(
                children: [
                  TCirlerContainer(height: 400, width: 500),
                  Column(
                    children: [
                      HomeAppbar(
                        hanlder: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(
                                user_id: user_id,
                                token: widget.token,
                              ),
                            ),
                          );
                        }, userData: user,
                      ),

                      const SizedBox(height: 16),

                      BodySearch(
                        color: Colors.white,
                        controller: txtSearchController,
                        handler: () async{
                          var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchContainer(
                                data_search: '',
                                handler: (String p1) {
                                  print(p1);
                                },
                              ),
                            ),
                          );
                          if(result != null){
                            fechAllProducts = productViewModel.getProduct(widget.token, category_id, selectedIndexPage, result);
                            print(fechAllProducts);
                            setState(() {});
                          }
                        },
                      ),

                      const SizedBox(height: 16),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const BodyTitleCategory(),
                              const SizedBox(height: 16),
                              Container(
                                height: 80,
                                child: TListCategory(
                                  categoryData: category,
                                  category_id: category_id,
                                  handler: (int value) {
                                    setState(() {
                                      category_id = value;
                                      fechAllProducts = productViewModel.getProduct(
                                        widget.token,
                                        value,
                                        selectedIndexPage,
                                        ""
                                      );
                                    });
                                  },
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      // Banner
                                      Container(
                                        height: 200,
                                        width: 380,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                       child:  Image.asset("assets/images/banner1.png")
                                       // child: BannerList.banner_list(bannerData: banner),
                                      ),

                                      const SizedBox(height: 20),
                                      const ProductTitle(),

                                      ProductGridview(
                                        token: widget.token,
                                        user_id: user_id,
                                        wish: wish,
                                        productsFuture: fechAllProducts,
                                      ),
                                      const SizedBox(height: 20,),
                                      SizedBox(
                                        height: 50,
                                        child: ListView.builder(
                                            itemCount: 3,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index){
                                              return GestureDetector(
                                                onTap: (){
                                                  if (index == 0) {
                                                    if (selectedIndexPage > 1) {
                                                      selectedIndexPage = selectedIndexPage - 1;
                                                    }
                                                  } else {
                                                    selectedIndexPage = selectedIndexPage + 1;
                                                  }
                                                  fechAllProducts =  productViewModel.getProduct(widget.token,category_id ,selectedIndexPage,"");
                                                  setState(() {

                                                  });
                                                },
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  padding: EdgeInsets.all(5),
                                                  margin: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius: BorderRadius.circular(12)
                                                  ),
                                                  child: Center(
                                                    child: Text("${(index == 0)
                                                        ? (selectedIndexPage - 1 < 1 ? "" : selectedIndexPage - 1)
                                                        : (index == 2 ? selectedIndexPage + 1 : selectedIndexPage)}", style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                                                  ),
                                                ),
                                              );
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
          }
        },
      ),
      bottomNavigationBar: ContainerBottom(token: widget.token),
    );

  }
}
