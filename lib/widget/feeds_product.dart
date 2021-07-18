import 'package:ecom_demo/models/product.dart';
import 'package:ecom_demo/pages/productDetailPage.dart';
import 'package:ecom_demo/providers/productProvider.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

class FeedProducts extends StatefulWidget {
  final int index;
  final List<Product>? products;

  const FeedProducts({required this.index, this.products});
  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<ProductsProvider>(
      builder: (BuildContext context, data, Widget? child) {
        if(widget.products!=null)data.setProductList(widget.products!);
        return InkWell(
          onTap: () => Navigator.pushNamed(context, ProductDetails.id,
            arguments: data.products[widget.index].id,
          ),
          child: Container(
            width: 240,
            height: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).backgroundColor),
            child: Column(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                                minHeight: 100,
                                maxHeight:
                                MediaQuery.of(context).size.height * 0.25),
                            child: Image.network(
                              data.products[widget.index].imageUrl,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Positioned(
                          // bottom: 0,
                          // right: 5,
                          // top: 5,
                          child: Badge(
                            alignment: Alignment.center,
                            toAnimate: true,
                            shape: BadgeShape.square,
                            badgeColor: Colors.pink,
                            borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(8)),
                            badgeContent:
                            Text('New', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 5),
                  margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        data.products[widget.index].description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          '\$ '+data.products[widget.index].price.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quantity: '+data.products[widget.index].quantity.toString(),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(18.0),
                                child: Icon(
                                  Icons.more_horiz,
                                  color: Colors.grey,
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
      ),
    );
  }
}
