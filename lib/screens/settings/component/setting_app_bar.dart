import 'package:flutter/material.dart';
import 'package:proyek/controllers/colorpalette.dart';

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onPressed;

  const SettingAppBar({Key? key, required this.onPressed}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorPallete.baseColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: ColorPallete.accentColor),
        onPressed: onPressed,
      ),
      title: Text(
        'Setting',
        style: TextStyle(color: ColorPallete.whiteColor),
      ),
    );
  }
}
