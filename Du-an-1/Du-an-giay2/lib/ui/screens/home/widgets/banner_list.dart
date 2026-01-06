import 'package:flutter/material.dart';

import '../../../shared/widget/my_image.dart';
import '../../../shared/widget/my_text.dart';


class BannerList extends StatelessWidget {
  final bannerData;
  const BannerList.banner_list({
    super.key, required this.bannerData,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount:bannerData?.length,
      itemBuilder: (context, index) {
        final item = bannerData["data"][index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: MyImage(
            width: 200,
            height: 370,
            url: item["image"]
          ),
        );
      },
    );
  }
}