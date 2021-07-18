import 'package:flutter/material.dart';

class OrderEmpty extends StatelessWidget {
  const OrderEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('No Order'),
      ),
    );
  }
}
