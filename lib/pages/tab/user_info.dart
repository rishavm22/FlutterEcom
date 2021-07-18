import 'package:ecom_demo/Utilities/const/colors.dart';
import 'package:ecom_demo/Utilities/const/my_icons.dart';
import 'package:ecom_demo/pages/auth/loginPage.dart';
import 'package:ecom_demo/pages/tab/cart.dart';
import 'package:ecom_demo/pages/tab/order.dart';
import 'package:ecom_demo/pages/tab/wishlist.dart';
import 'package:ecom_demo/providers/isLogProvider.dart';
import 'package:ecom_demo/providers/statusProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

class UserInfoTab extends StatefulWidget {
  const UserInfoTab({Key? key}) : super(key: key);

  @override
  _UserInfoTabState createState() => _UserInfoTabState();
}

class _UserInfoTabState extends State<UserInfoTab> {
  late ScrollController _scrollController;
  var top = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 4,
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              top = constraints.biggest.height;
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        ColorsConsts.starterColor,
                        ColorsConsts.endColor,
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  centerTitle: true,
                  title: Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: top <= 110.0 ? 1.0 : 0,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              height: kToolbarHeight / 1.8,
                              width: kToolbarHeight / 1.8,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 1.0,
                                  ),
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              // 'top.toString()',
                              'Guest',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  background: Image(
                    image: NetworkImage(
                        'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: userTitle('User Bag')),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Theme.of(context).splashColor,
                      child: ListTile(
                        onTap: () => Navigator.of(context).pushNamed(
                            WishlistTab.id
                        ),
                        title: Text('Wishlist'),
                        trailing: Icon(Icons.chevron_right_rounded),
                        leading: Icon(MyAppIcons.wishlist),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Theme.of(context).splashColor,
                      child: ListTile(
                        onTap: () =>Navigator.of(context).pushNamed(
                            CartTab.id
                        ),
                        title: Text('Cart'),
                        trailing: Icon(Icons.chevron_right_rounded),
                        leading: Icon(MyAppIcons.cart),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Theme.of(context).splashColor,
                      child: ListTile(
                        onTap: () =>Navigator.of(context).pushNamed(
                            MyOrder.id
                        ),
                        title: Text('My Orders'),
                        trailing: Icon(Icons.chevron_right_rounded),
                        leading: Icon(MyAppIcons.orders),
                      ),
                    ),
                  ),
                  userTitle('User Info'),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  userListTitle('Email', 'email', MyAppIcons.email, context),
                  userListTitle(
                      'PhoneNo', '9999999999', MyAppIcons.phone, context),
                  userListTitle('Shipping Address', 'subTitle',
                      MyAppIcons.shipping, context),
                  userListTitle(
                      'Joined Date', 'subTitle', MyAppIcons.joined, context),
                  userTitle('User Setting'),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Consumer<StatusProvider>(
                    builder: (BuildContext context, data, Widget? child) {
                      return ListTileSwitch(
                        value: data.getSwitchTitleStatus,
                        leading: Icon(MyAppIcons.moon),
                        onChanged: (value) {
                          data.setSwitchTitleStatus(value);
                        },
                        visualDensity: VisualDensity.comfortable,
                        switchType: SwitchType.cupertino,
                        switchActiveColor: Colors.indigo,
                        title: Text('Dark Theme'),
                      );
                    },
                  ),
                  userListTitle('Logout', 'logout', MyAppIcons.exit, context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding userTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }

  Material userListTitle(
      String title, String subTitle, IconData iconData, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {
            if(title.compareTo('Logout')==0){
              try {
                FirebaseAuth.instance.signOut();
                context.read<IsLoggedProvider>().setLoggedStatus(false);
                Navigator.pushNamed(context, LoginPage.id);
              } catch (e) {}
            }

          },
          title: Text(
            title,
          ),
          subtitle: Text(
            subTitle,
          ),
          leading: Icon(
            MyAppIcons.email,
          ),
        ),
      ),
    );
  }
}
