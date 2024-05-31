import 'package:flutter/material.dart';
import 'package:proyek/controllers/colorpalette.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const SidebarItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: ColorPallete.baseColor),
      title: Text(text, style: TextStyle(color: ColorPallete.baseColor)),
      onTap: onTap,
    );
  }
}
