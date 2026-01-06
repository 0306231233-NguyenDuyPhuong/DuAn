import 'package:flutter/material.dart';
import '../../shared/widget/my_text.dart';

class VariantValueSizeList extends StatefulWidget {
  final List list_variant_size;
  final String data;
  final String id;
  final Function(String, String) onChanged;

  const VariantValueSizeList({
    super.key,
    required this.list_variant_size,
    required this.data,
    required this.onChanged, required this.id,
  });

  @override
  State<VariantValueSizeList> createState() => _ListVariantValueSizeState();
}

class _ListVariantValueSizeState extends State<VariantValueSizeList> {
  String? idSize;
  String? valueSize;
  int? isSelectedIndexSize;
  bool checkSize = false;

  @override
  void initState() {
    super.initState();
    idSize = widget.id; // giá trị nhận từ file cha
    valueSize = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.list_variant_size.length,
      itemBuilder: (context, index) {
        final item = widget.list_variant_size[index];
        final isSelectedSize = isSelectedIndexSize == index;

        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 4),
          child: GestureDetector(
            onTap: () {
              setState(() {
                idSize = item['id'].toString();
                valueSize = item["value"].toString();
                isSelectedIndexSize = index;
                checkSize = true;
              });

              widget.onChanged(idSize!, valueSize!);
            },
            child: Container(
              height: 60,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isSelectedSize
                    ? Colors.blueAccent
                    : Colors.grey.withOpacity(0.2),
              ),
              child: Center(
                child: MyText(
                  title: "${item['value']}",
                  size: 20,
                  color: isSelectedSize ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
