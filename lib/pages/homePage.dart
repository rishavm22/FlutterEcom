import 'package:ecom_demo/pages/bottomBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = "home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _tabsPageController;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context)!.settings.arguments !=null){
      final arg = ModalRoute.of(context)!.settings.arguments as Map;

      return Scaffold(
        body: BottomBarPage(pageNo: arg['pageNo']!=null?arg['pageNo']:0,),
      );
    }

    return Scaffold(
      body: BottomBarPage(pageNo: 0,),
    );
  }
}
