import 'package:flutter/material.dart';
import 'package:proyek/screens/cart/cart_page.dart';
import 'package:proyek/screens/order/order_track.dart';
import '../../sidebar/sidebar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.deepPurple),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Sidebar()),
          );
        },
      ),
      title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.deepPurple),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.deepPurple),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(30.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6200EE)),
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6200EE)),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart, color: Colors.deepPurple),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          },
        ),
      ],
    );
  }
}