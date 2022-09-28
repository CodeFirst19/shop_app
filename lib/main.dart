import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import '../screens/tab_screen.dart';


import './screens/product_detail_screen.dart';
import './screens/product_overview_screen.dart';
import 'models/cart.dart';
import 'models/orders.dart';
import 'models/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MultiProvider allows us to grouple two/more providers instead of nesting them
    // Here we are doing this because we want to include Cart provider as well
    return MultiProvider(providers: [
      // ChangeNotifierProvider returns not a widget but a new instance of a provider class
      // The following syntaxes are the same (first two). the dot value syntax is much preferable when rendering provider with a list
      // to ensure that the provider is always working without any issues.
      //ChangeNotifierProvider.value(value: Products()),
      ChangeNotifierProvider(create: (ctx) => Products()),
      ChangeNotifierProvider(create: (ctx) => Cart()),
      ChangeNotifierProvider(create: (ctx) => Orders()),
    ],
      // This above will provide one instance to all the child widgets of this main widget
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith(secondary: Colors.redAccent),
          primaryColor: Colors.white,
          fontFamily: 'SF-Pro',
          // fontFamily: GoogleFonts.openSans().fontFamily,
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.black,
            hoverColor: Colors.amber
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          )
        ),
        home: TabScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
        },
      ),
    );
  }
}
