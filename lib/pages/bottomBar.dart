import 'package:ecom_demo/Utilities/const/my_icons.dart';
import 'package:ecom_demo/pages/tab/cart.dart';
import 'package:ecom_demo/pages/tab/feed.dart';
import 'package:ecom_demo/pages/tab/home.dart';
import 'package:ecom_demo/pages/tab/search.dart';
import 'package:ecom_demo/pages/tab/user_info.dart';
import 'package:ecom_demo/providers/tabProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  late List<Map<String, Widget>> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      {'tab': HomeTab()},
      {'tab': FeedsTab()},
      {'tab': SearchTab()},
      {'tab': CartTab()},
      {'tab': UserInfoTab()},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
        builder: (BuildContext context, data, Widget? child) {
      return Scaffold(
        body: _tabs[data.getSelectedPageIndex]['tab'],
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 0.01,
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.blue.shade900,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectTab,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: Colors.blue.shade700,
              currentIndex: data.getSelectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.home),
                  label: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.feed),
                  label: 'Feeds'
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.search),
                  label: 'Search'
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.cart),
                  label: 'Cart'
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.user),
                  label: 'User'
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void _selectTab(int index) {
    context.read<TabProvider>().setSelectedPageIndex(index);
  }
}
