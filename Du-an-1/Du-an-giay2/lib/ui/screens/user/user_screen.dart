import 'package:coffee_shop_test/data/viewmodels/user_viewmodels.dart';
import 'package:coffee_shop_test/ui/screens/user/update_user_screen.dart';
import 'package:coffee_shop_test/ui/shared/widget/container_bottom.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/widget/TCirlerContainer.dart';
import '../../shared/widget/my_icon.dart';
import '../../shared/widget/my_text.dart';
import 'widgets/account_settings_container.dart';

class UserScreen extends StatefulWidget {
  final String token;
  final userData;
  const UserScreen({super.key, required this.token, required this.userData});

  @override
  State<UserScreen> createState() => _UserState();
}

class _UserState extends State<UserScreen> {
  late Future<Map<String, dynamic>> fetchData;
  UserViewModel userViewModel = UserViewModel();
  Future<Map<String, dynamic>> loadData() async {
    final result = await Future.wait([userViewModel.userProfile(widget.token)]);
    return {"user": result[0]};
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData = loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchData,
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
              final user = snapshot.data!["user"]["user"]["data"];
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        // Header area
                        SizedBox(
                          height: 200,
                          child: Stack(
                            children: [
                              TCirlerContainer(height: 200, width: 500),
                              Padding(
                                padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const MyText(
                                      title: "Account",
                                      size: 27,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(200),
                                                color: Colors.black87
                                              ),
                                              clipBehavior: Clip.hardEdge,
                                              child: Image.network(
                                                "http://10.0.2.2:8989/api/images/${user["avatar"]}",
                                                width: 60,
                                                height: 60,
                                              ),
                                            ),
                                            const SizedBox(width: 20,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                MyText(
                                                  title: "${user["name"]}",
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                                MyText(
                                                  title: "${user["phone"]}",
                                                  size: 16,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () async{
                                            final result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateUserScreen(token: widget.token)));
                                            if(result){
                                              setState(() {
                                                fetchData = loadData();
                                              });
                                            }
                                            },
                                          icon: Icon(Iconsax.edit, color: Colors.white, size: 28),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Body content
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                title: "Account Settings",
                                size: 23,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: AccountSettingsContainer(token: widget.token, user_id: user["id"],),
                              ),
                              const SizedBox(height: 30),
                              MyText(
                                title: "App Settings",
                                size: 23,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
