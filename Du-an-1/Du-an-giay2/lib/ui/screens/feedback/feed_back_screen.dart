import 'package:coffee_shop_test/data/services/feedback_service.dart';
import 'package:coffee_shop_test/ui/shared/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FeedBackScreen extends StatefulWidget {
  final String token;
  final int product_id;
  const FeedBackScreen({
    super.key,
    required this.token,
    required this.product_id,
  });

  @override
  State<FeedBackScreen> createState() => _FeedBackViewsState();
}

class _FeedBackViewsState extends State<FeedBackScreen> {
  late Future<Map<String, dynamic>> _fetchData;
  FeedbackService feedbackService = FeedbackService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          title: "Reviews & Ratings",
          size: 25,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: FutureBuilder(
        future: feedbackService.getFeedBacks(widget.token, widget.product_id),
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
              final feedBackData = snapshot.data!["data"];
              return ListView.builder(
                shrinkWrap: true,
                itemCount: feedBackData.length,
                itemBuilder: (context, index) {
                  final item = feedBackData[index];
                  final user = item['user'];
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
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
                                const SizedBox(width: 10),
                                MyText(
                                  title: "${user["name"]}",
                                  size: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.menu_sharp),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 150,
                              child: Row(
                                children: [
                                  Icon(Icons.star, color: Colors.blueAccent),
                                  Icon(Icons.star, color: Colors.blueAccent),
                                  Icon(Icons.star, color: Colors.blueAccent),
                                  Icon(Icons.star, color: Colors.blueAccent),
                                  Icon(Icons.star, color: Colors.blueAccent),
                                ],
                              ),
                            ),
                            MyText(
                              title: "${item["created_at"]}",
                              size: 15,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        Text(
                          "${item["content"]}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
