import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsLoggedProvider extends ChangeNotifier {
  bool isSigned = false;
  bool get getLoggedStatus {
    updateLocalStatus();
    return isSigned;
  }

  void setLoggedStatus(bool v) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isSigned', v);
    notifyListeners();
  }

  updateLocalStatus() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool('isSigned')!=null){
      isSigned= prefs.getBool('isSigned')!;
    }else {
      isSigned= false;
    }
  }
}