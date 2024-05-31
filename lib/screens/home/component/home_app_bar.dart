import 'package:flutter/material.dart';
import 'package:proyek/controllers/colorpalette.dart';
import 'package:proyek/screens/cart/cart_page.dart';
import '../../sidebar/sidebar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isProductByCategory;

  HomeAppBar({this.isProductByCategory = false,});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:ColorPallete.baseColor,
      leading: isProductByCategory
          ? IconButton(
        icon: Icon(Icons.arrow_back, color: ColorPallete.accentColor),
        onPressed: () {
          Navigator.pop(context);
        },
      )
          : IconButton(
        icon: Icon(Icons.menu, color: ColorPallete.accentColor),
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
          color: ColorPallete.baseColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart, color: ColorPallete.accentColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(), // Melewatkan selectedTimeZone ke CartPage
              ),
            );
          },
        ),
      ],
    );
  }
}

