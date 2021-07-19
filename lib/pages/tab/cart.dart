import 'package:ecom_demo/Utilities/const/colors.dart';
import 'package:ecom_demo/Utilities/const/my_icons.dart';
import 'package:ecom_demo/models/orders.dart';
import 'package:ecom_demo/pages/cartFilled.dart';
import 'package:ecom_demo/pages/checkoutPage.dart';
import 'package:ecom_demo/pages/tab/order.dart';
import 'package:ecom_demo/providers/cart_provider.dart';
import 'package:ecom_demo/providers/orderProvider.dart';
import 'package:ecom_demo/services/databaseService.dart';
import 'package:ecom_demo/services/global_method.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../emptyCart.dart';

class CartTab extends StatelessWidget {
  static String id = 'cartTab';
  @override
  Widget build(BuildContext context) {

    GlobalMethods globalMethods = GlobalMethods();
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isEmpty
        ? Scaffold(body: EmptyCartPage())
        : Scaffold(
            bottomSheet: checkoutSection(context, globalMethods, cartProvider),
            appBar: AppBar(
              backgroundColor: Theme.of(context).backgroundColor,
              title: Text('Cart (${cartProvider.getCartItems.length})'),
              actions: [
                IconButton(
                  onPressed: () {
                    globalMethods.showDialogg(
                        'Clear cart!',
                        'Your cart will be cleared!',
                        () => cartProvider.clearCart(),
                        context);
                    // cartProvider.clearCart();
                  },
                  icon: Icon(MyAppIcons.delete),
                )
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                  itemCount: cartProvider.getCartItems.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return ChangeNotifierProvider.value(
                      value: cartProvider.getCartItems.values.toList()[index],
                      child: CartFilled(
                        productId:
                            cartProvider.getCartItems.keys.toList()[index],
                      ),
                    );
                  }),
            ),
          );
  }

  Widget checkoutSection(BuildContext ctx, GlobalMethods globalMethods,
      CartProvider cartProvider) {

    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            /// mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      ColorsConsts.gradientLStart,
                      ColorsConsts.gradientLEnd,
                    ], stops: [
                      0.0,
                      0.7
                    ]),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        globalMethods.showDialogg(
                            'Clear cart!',
                            'Your cart will be cleared!',
                            () => cartProvider.clearCart(),
                            ctx);
                        Navigator.pushNamed(ctx, CheckoutPage.id);
                      },
                      splashColor: Theme.of(ctx).splashColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {
                            DatabaseServices databaseService = DatabaseServices();

                            ctx.read<OrderProvider>().addOrder(new Orders(
                                totalQuantity: cartProvider.quantity,
                                totalPrice: cartProvider.totalAmount,
                                id: DateTime.now().toString(),
                                customerId: databaseService.getUserId(),
                                status: 'Order Placed'));
                            cartProvider.clearCart();

                            Navigator.pushNamed(ctx, MyOrder.id);
                          },
                          child: Text(
                            'Checkout',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(ctx).textSelectionColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text(
                'Total:',
                style: TextStyle(
                    color: Theme.of(ctx).textSelectionColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'US ${cartProvider.totalAmount.toStringAsFixed(3)}',
                //textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ));
  }
}
