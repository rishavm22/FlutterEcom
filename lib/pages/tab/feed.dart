import 'package:ecom_demo/widget/feeds_product.dart';
import 'package:flutter/material.dart';

class FeedsTab extends StatelessWidget {
  static final String id = "feed";

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 240/400,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: List.generate(100, (index) {
        return FeedProducts(index: index,);
      }),
    );
  }
}
