import 'package:ecom_demo/pages/homePage.dart';
import 'package:ecom_demo/providers/orderProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderFull extends StatefulWidget {
  const OrderFull({Key? key}) : super(key: key);

  @override
  _OrderFullState createState() => _OrderFullState();
}

class _OrderFullState extends State<OrderFull> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          children: [
            for (var i = 0; i < value.getOrders.length; i++)
              orderItem(i, value),
          ],
        );
      },
    );
  }

  orderItem(int index, OrderProvider value) {
    return Center(
      child: Container(
        color: Colors.blueAccent.shade100,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Price: ',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value.getOrders[index].totalPrice.toString() + ' \$',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Quantity: ',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value.getOrders[index].totalQuantity.toString(),
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value.getOrders[index].status,
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order Placed At: ',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value.getOrders[index].id,
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, HomePage.id,arguments: {'pageNo':2});
              },
              child: Text('Track Order'),
            ),
          ],
        ),
      ),
    );
  }
}
