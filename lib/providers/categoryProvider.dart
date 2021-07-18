import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  String _categoryName = 'All';

  String get categoryName => _categoryName;

  void setCategoryName(String n){
    _categoryName=n;
    notifyListeners();
  }
}