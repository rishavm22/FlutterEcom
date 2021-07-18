import 'package:flutter/material.dart';

class StatusProvider extends ChangeNotifier {
  bool _showPassword = false;
  bool _isLoading=false;
  bool _switchTitleStatus=false;
  bool _isCartEmpty=false;

  bool get getPasswordVisibility => _showPassword;
  bool get getLoadingStatus => _isLoading;
  bool get getSwitchTitleStatus => _switchTitleStatus;
  bool get getCartStatus => _isCartEmpty;

  void setPasswordVisibility() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  void setLoadingStatus(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  void setSwitchTitleStatus(bool v) {
    _switchTitleStatus = v;
    notifyListeners();
  }

  void setCartStatus(bool v) {
    _isCartEmpty = v;
    notifyListeners();
  }

}