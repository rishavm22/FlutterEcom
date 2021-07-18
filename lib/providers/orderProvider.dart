import 'package:ecom_demo/models/orders.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  List<Orders> _orders = [];

  List<Orders> get getOrders {
    return _orders;
  }

  void addOrder(Orders v) async{
    _orders.add(v);
    notifyListeners();
  }

  void removeOrder(Orders v) async{
    _orders.remove(v);
    notifyListeners();
  }
}