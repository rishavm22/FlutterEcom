import 'package:ecom_demo/providers/orderProvider.dart';
import 'package:ecom_demo/widget/orderEmpty.dart';
import 'package:ecom_demo/widget/orderFull.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrder extends StatefulWidget {
  static String id = 'order';

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {

  @override
  Widget build(BuildContext context) {
    bool isOrderAvailable = context.read<OrderProvider>().getOrders.isEmpty;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: isOrderAvailable?OrderEmpty():OrderFull(),
    );
  }
}
