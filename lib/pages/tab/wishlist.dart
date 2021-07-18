import 'package:ecom_demo/Utilities/const/my_icons.dart';
import 'package:ecom_demo/providers/favsProvider.dart';
import 'package:ecom_demo/services/global_method.dart';
import 'package:ecom_demo/widget/wishlist_empty.dart';
import 'package:ecom_demo/widget/wishlist_full.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistTab extends StatelessWidget {
  static const id = 'wishlist';
  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods =GlobalMethods();
    final favsProvider =Provider.of<FavsProvider>(context);
    return favsProvider.getFavsItems.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
      appBar: AppBar(
        title: Text('Wishlist (${favsProvider.getFavsItems.length})'),
        actions: [
          IconButton(
            onPressed: () {
              globalMethods.showDialogg(
                  'Clear wishlist!',
                  'Your wishlist will be cleared!',
                      () => favsProvider
                      .clearFavs(),context);
              // cartProvider.clearCart();
            },
            icon: Icon(MyAppIcons.delete),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: favsProvider.getFavsItems.length,
        itemBuilder: (BuildContext ctx, int index) {
          return ChangeNotifierProvider.value(
              value: favsProvider.getFavsItems.values.toList()[index],
              child: WishlistFull(
                productId: favsProvider.getFavsItems.keys.toList()[index],
              ));
        },
      ),
    );
  }
}
