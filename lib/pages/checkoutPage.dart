import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  static const id = 'checkout';

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            'Your Order Is Placed',
            style: TextStyle(
              fontSize: 36,
              color: Colors.blue.shade900,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
