import 'package:ecom_demo/providers/categoryProvider.dart';
import 'package:ecom_demo/providers/productProvider.dart';
import 'package:ecom_demo/widget/feeds_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesFeedsPage extends StatefulWidget {
  static const id = 'categoriesFeeds';

  @override
  _CategoriesFeedsPageState createState() => _CategoriesFeedsPageState();
}

class _CategoriesFeedsPageState extends State<CategoriesFeedsPage> {

  
  @override
  Widget build(BuildContext context) {
    context.read<CategoryProvider>().setCategoryName(ModalRoute.of(context)!.settings.arguments as String);

    return Scaffold(
      body: Consumer<ProductsProvider>(
          builder: (BuildContext context, data, Widget? child) {

        return GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 420,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children:
              List.generate(data.findByCategory(context.read<CategoryProvider>().categoryName).length, (index) {
            return FeedProducts(
              index: index,
              products: data.findByCategory(context.read<CategoryProvider>().categoryName),
            );
          }),
        );
      }),
    );
  }
}
