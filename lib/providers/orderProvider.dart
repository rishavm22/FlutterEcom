import 'package:ecom_demo/models/orders.dart';
import 'package:ecom_demo/services/databaseService.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  List<Orders> _orders = [];

  DatabaseServices _databaseServices = DatabaseServices();

  List<Orders> get getOrders {
    return _orders;
  }

  void addOrder(Orders v) async{
    _orders.add(v);
    _databaseServices.addOrder({
      'orderId': v.id,
      'totalPrice': v.totalPrice,
      'totalQuantity': v.totalQuantity,
      'status': v.status
    },v.id);
    notifyListeners();
  }

  void removeOrder(Orders v) async{
    _orders.remove(v);
    notifyListeners();
  }
}