import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:proyek/screens/home/home_page.dart';
import 'package:proyek/screens/order/order_track.dart';
import 'package:proyek/screens/profile/profile.dart';
import 'package:proyek/screens/settings/setting.dart';
import 'package:proyek/screens/wishlist/wishlist.dart';
import 'models/cart.dart';
import 'screens/login/login_page.dart';
import 'screens/register/register_page.dart';
import 'screens/product/product_page.dart';
import 'screens/sidebar/sidebar.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartAdapter());
  await Hive.openBox<Cart>('cartBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/wishlist': (context) => WishlistPage(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
