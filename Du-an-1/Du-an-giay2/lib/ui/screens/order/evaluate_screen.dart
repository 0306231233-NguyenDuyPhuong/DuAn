import 'package:coffee_shop_test/data/models/feedback.dart';
import 'package:coffee_shop_test/data/viewmodels/feedback_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/widget/my_image.dart';
import '../../shared/widget/my_text.dart';

class EvaluateScreen extends StatefulWidget {
  final String token;
  final int user_id;
  final cart;
  final productVariantValue;
  final product;
  const EvaluateScreen({super.key, required this.token, required this.user_id,required this.cart, this.productVariantValue,required this.product});

  @override
  State<EvaluateScreen> createState() => _EvaluateScreenState();
}

class _EvaluateScreenState extends State<EvaluateScreen> {
  FeedbackViewmodels feedbackViewmodel = FeedbackViewmodels();
  TextEditingController txtCommentController = TextEditingController();
  int? seletedIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(title: "Evaluated", size: 25, color: Colors.black87, fontWeight: FontWeight.bold,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(title: "Evaluate customer", size: 30, color: Colors.black87, fontWeight: FontWeight.bold,),
          const SizedBox(height: 10,),
          SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return IconButton(onPressed: (){
                    setState(() {
                      seletedIndex = index;
                    });
                  }, icon: (seletedIndex!>index-1)?Icon( Iconsax.star1, size: 60, color: Colors.yellow,):Icon( Iconsax.star, size: 60, color: Colors.grey,));
                }),
          ),
          Container(
            height: 300,
            width: 400,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey,
                    width: 1.5
                ),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Comment",
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                    controller: txtCommentController,
                  ),
                ),
                const SizedBox(width: 10,),
                IconButton(onPressed: ()async{
                  final star = seletedIndex! +1;

                  final feedback = FeedbackModel(product_id: widget.product["id"], user_id: widget.user_id, star: star, content: txtCommentController.text);
                  final result = await feedbackViewmodel.postFeedback(widget.token, feedback);
                  if(result['feedbacks']["status"]==200){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Thêm đánh giá thành công"))
                    );
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Thêm đánh giá thất bại"))
                    );
                  }
                }, icon: Icon(Iconsax.send_1, size: 30, color: Colors.blue,))
              ],
            ),
          ),

          Container(
            height: 120,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        "http://10.0.2.2:8989/api/images/${widget.product['image']}",
                      ),
                    ),
                  ),
                ),
                //Titile
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            title: "Nike",
                            size: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.withOpacity(0.6),
                          ),
                          MyText(
                            title: "${widget.product['name']}",
                            size: 17,
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                          ),
                          MyText(
                            title: "${widget.productVariantValue['price']}",
                            size: 17,
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                          ),
                          MyText(
                            title: "${widget.cart['quantity']}",
                            size: 17,
                            color: Colors.black.withOpacity(0.7),
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
        ],
      ),
    );
  }
}