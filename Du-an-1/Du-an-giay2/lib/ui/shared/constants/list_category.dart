import 'package:flutter/material.dart';
import '../widget/my_image.dart';

class TListCategory extends StatefulWidget {
  final categoryData;
  final int category_id;
  final Function(int) handler;
  const TListCategory({super.key, required this.categoryData, required this.category_id, required this.handler});
  @override
  State<TListCategory> createState() => _TListCategoryState();
}

class _TListCategoryState extends State<TListCategory> {
  int selectedIndex = -1;
  int status = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryData!["data"].length,
        itemBuilder: (context, index) {
          final item = widget.categoryData!["data"][index];
          bool selected = (index == selectedIndex);

          return GestureDetector(
            onTap: () {
              setState(() {
                if(selectedIndex == index){
                  selectedIndex = -1;
                  widget.handler(-1);
                }else{
                  selectedIndex = index;
                  widget.handler(item["id"]);
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? Colors.grey : Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: MyImage(
                    width: 50,
                    height: 50,
                    url: item["image"],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
/**/