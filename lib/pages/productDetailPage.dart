import 'dart:ui';
import 'package:ecom_demo/Utilities/const/colors.dart';
import 'package:ecom_demo/Utilities/const/my_icons.dart';
import 'package:ecom_demo/models/orders.dart';
import 'package:ecom_demo/pages/tab/cart.dart';
import 'package:ecom_demo/pages/tab/order.dart';
import 'package:ecom_demo/pages/tab/wishlist.dart';
import 'package:ecom_demo/providers/cart_provider.dart';
import 'package:ecom_demo/providers/favsProvider.dart';
import 'package:ecom_demo/providers/orderProvider.dart';
import 'package:ecom_demo/providers/productProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'checkoutPage.dart';
// import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  static const id = 'productDetails';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  GlobalKey previewContainer = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final favsProvider = Provider.of<FavsProvider>(context);
    return Scaffold(
      body: Consumer<ProductsProvider>(
          builder: (BuildContext context, data, Widget? child) {
        return Stack(
          children: <Widget>[
            Container(
              foregroundDecoration: BoxDecoration(color: Colors.black12),
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.network(
                data.findById(productId).imageUrl,
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 250),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.purple.shade200,
                            onTap: () {},
                            borderRadius: BorderRadius.circular(30),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.save,
                                size: 23,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.purple.shade200,
                            onTap: () {},
                            borderRadius: BorderRadius.circular(30),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.share,
                                size: 23,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //padding: const EdgeInsets.all(16.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Text(
                                  data.findById(productId).title,
                                  maxLines: 2,
                                  style: TextStyle(
                                    // color: Theme.of(context).textSelectionColor,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                // 'US \$ ${prodAttr.price}',
                                'US \$ ' +
                                    data.findById(productId).price.toString(),
                                style: TextStyle(
                                    color: ColorsConsts.subTitle,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21.0),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 3.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            data.findById(productId).description,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 21.0,
                              color: ColorsConsts.subTitle,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                            height: 1,
                          ),
                        ),
                        // _details(themeState.darkTheme, 'Brand: ', prodAttr.brand),
                        // _details(themeState.darkTheme, 'Quantity: ', '${prodAttr.quantity}'),
                        // _details(themeState.darkTheme, 'Category: ', prodAttr.productCategoryName),
                        // _details(themeState.darkTheme, 'Popularity: ', prodAttr.isPopular? 'Popular' : 'Barely known'),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),

                        // const SizedBox(height: 15.0),
                        Container(
                          color: Theme.of(context).backgroundColor,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'No reviews yet',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).textSelectionColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 21.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  'Be the first review!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.0,
                                    color: ColorsConsts.subTitle,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                                height: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    "DETAIL",
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.normal),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        MyAppIcons.wishlist,
                        color: ColorsConsts.favColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(WishlistTab.id);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        MyAppIcons.cart,
                        color: ColorsConsts.cartColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartTab.id);
                      },
                    ),
                  ]),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 50,
                      child: RaisedButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(side: BorderSide.none),
                        color: Colors.redAccent.shade400,
                        onPressed: () {
                          if (cartProvider.getCartItems
                              .containsKey(productId)) {
                            Navigator.pushNamed(context, CartTab.id);
                          } else {
                            cartProvider.addProductToCart(
                                productId,
                                data.findById(productId).price,
                                data.findById(productId).title,
                                data.findById(productId).imageUrl);
                          }
                        },
                        child: Text(
                          cartProvider.getCartItems.containsKey(productId)
                              ? 'In Cart'.toUpperCase()
                              : 'Add to Cart'.toUpperCase(),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 50,
                      child: RaisedButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(side: BorderSide.none),
                        color: Theme.of(context).backgroundColor,
                        onPressed: () {
                          Navigator.pushNamed(context, CheckoutPage.id);
                        },
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                context.read<OrderProvider>().addOrder(
                                    new Orders(
                                        totalQuantity:
                                            data.findById(productId).quantity,
                                        totalPrice: data
                                                .findById(productId)
                                                .price *
                                            data.findById(productId).quantity,
                                        id: DateTime.now().toString(),
                                        status: 'Order Placed'));
                                cartProvider.clearCart();
                                Navigator.pushNamed(context, MyOrder.id);
                              },
                              child: Text(
                                'Buy now'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .textSelectionTheme
                                        .selectionColor),
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(
                              Icons.payment,
                              color: Colors.green.shade700,
                              size: 19,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: ColorsConsts.subTitle,
                      height: 50,
                      child: InkWell(
                        splashColor: ColorsConsts.favColor,
                        onTap: () {
                          favsProvider.addAndRemoveFromFav(
                              productId,
                              data.findById(productId).price,
                              data.findById(productId).title,
                              data.findById(productId).imageUrl);
                        },
                        child: Center(
                          child: Icon(
                            MyAppIcons.wishlist,
                            color: ColorsConsts.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]))
          ],
        );
      }),
    );
  }

  Widget _details(bool themeState, String title, String info) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Theme.of(context).textSelectionColor,
                fontWeight: FontWeight.w600,
                fontSize: 21.0),
          ),
          Text(
            info,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20.0,
              color: themeState
                  ? Theme.of(context).disabledColor
                  : ColorsConsts.subTitle,
            ),
          ),
        ],
      ),
    );
  }
}
