import 'package:flutter/material.dart';
import 'package:proyek/controllers/colorpalette.dart';

class SidebarAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onPressed;

  const SidebarAppBar({Key? key, required this.onPressed}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorPallete.baseColor,
      leading: IconButton(
        icon: Icon(Icons.menu, color: ColorPallete.accentColor),
        onPressed: onPressed,
      ),
    );
  }
}
