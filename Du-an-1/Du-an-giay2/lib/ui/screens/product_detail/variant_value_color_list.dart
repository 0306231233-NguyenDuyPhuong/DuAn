import 'package:flutter/material.dart';

class VariantValueColorList extends StatefulWidget {
  final String data;
  final String id;
  final Function(String,String) onChanged;
  final list_variant_value_color;
  const VariantValueColorList({
    super.key,
    required this.list_variant_value_color, required this.data, required this.onChanged, required this.id,
  });

  @override
  State<VariantValueColorList> createState() => _ListVariantValueColorState();
}

class _ListVariantValueColorState extends State<VariantValueColorList> {
  var color;
  String? idColors;
  String? valueColor;
  int? isSelectedIndexColor;
  bool checkColor = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idColors = widget.id;
    valueColor = widget.data;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.list_variant_value_color.length,
      itemBuilder: (context, index) {
        final item = widget.list_variant_value_color[index];
        final variant = widget.list_variant_value_color[index];
        final isSelectedColor = isSelectedIndexColor == index;
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 4),
          child: GestureDetector(
            onTap: () {
              setState(() {
                color = item["value"];
                valueColor = item["value"];
                isSelectedIndexColor = index;
                checkColor = true;
                idColors = variant['id'].toString();
              });
              widget.onChanged(idColors!, valueColor!);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(400),
                border: Border.all(
                  color: isSelectedColor ? Color(int.parse(color)) : Colors.white,
                  width: 5,
                ),
                color: Color(int.parse(item['value'])),
              ),
              child: Center(child: isSelectedColor ? Icon(Icons.check, color: Colors.white, size: 30, fontWeight: FontWeight.bold,):null),
            ),
          ),
        );
      },
    );
  }
}
