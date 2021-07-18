import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int _selectedPageIndex = 0;

  int get getSelectedPageIndex {
    return _selectedPageIndex;
  }

  void setSelectedPageIndex(int v) async{
    _selectedPageIndex=v;
    notifyListeners();
  }
}