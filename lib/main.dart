import 'dart:async';

import 'package:ecom_demo/pages/auth/forgetPage.dart';
import 'package:ecom_demo/pages/auth/loginPage.dart';
import 'package:ecom_demo/pages/auth/regPage.dart';
import 'package:ecom_demo/pages/categoriesFeedsPage.dart';
import 'package:ecom_demo/pages/checkoutPage.dart';
import 'package:ecom_demo/pages/homePage.dart';
import 'package:ecom_demo/pages/productDetailPage.dart';
import 'package:ecom_demo/pages/tab/cart.dart';
import 'package:ecom_demo/pages/tab/feed.dart';
import 'package:ecom_demo/pages/tab/order.dart';
import 'package:ecom_demo/pages/tab/wishlist.dart';
import 'package:ecom_demo/providers/cart_provider.dart';
import 'package:ecom_demo/providers/categoryProvider.dart';
import 'package:ecom_demo/providers/favsProvider.dart';
import 'package:ecom_demo/providers/isLogProvider.dart';
import 'package:ecom_demo/providers/orderProvider.dart';
import 'package:ecom_demo/providers/productProvider.dart';
import 'package:ecom_demo/providers/statusProvider.dart';
import 'package:ecom_demo/providers/tabProvider.dart';
import 'package:ecom_demo/widget/brands_navigation_rail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/localization/form_builder_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IsLoggedProvider()),
        ChangeNotifierProvider(create: (_) => StatusProvider()),
        ChangeNotifierProvider(create: (_) => TabProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => FavsProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<IsLoggedProvider>(
        builder: (BuildContext context, data, Widget? child) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              localizationsDelegates: [
                FormBuilderLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en', ''),
                Locale('es', ''),
                Locale('fr', ''),
                Locale('ja', ''),
                Locale('pt', ''),
                Locale('sk', ''),
                Locale('pl', ''),
              ],
              initialRoute: StarterPage.id,
              routes: {
                StarterPage.id: (context) => StarterPage(),
                HomePage.id: (context) => HomePage(),
                LoginPage.id: (context) => LoginPage(),
                RegistrationPage.id: (context) => RegistrationPage(),
                ForgetPage.id: (context) => ForgetPage(),
                BrandNavigationRailScreen.id: (context) => BrandNavigationRailScreen(),
                FeedsTab.id: (context) => FeedsTab(),
                WishlistTab.id: (context) => WishlistTab(),
                CartTab.id: (context) => CartTab(),
                ProductDetails.id: (context) => ProductDetails(),
                CategoriesFeedsPage.id: (context) => CategoriesFeedsPage(),
                CheckoutPage.id: (context) => CheckoutPage(),
                MyOrder.id: (context) => MyOrder(),
              });
        });
  }
}



class StarterPage extends StatefulWidget {
  static final String id = "starter";

  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IsLoggedProvider>(
      builder: (BuildContext context, data, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: data.getLoggedStatus ? HomePage() : LoginPage(),
        );
      },
    );
  }
}

