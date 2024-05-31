import 'package:flutter/material.dart';
import 'package:proyek/controllers/colorpalette.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.emoji_people, // Ganti dengan logo Anda
          size: 100,
          color: ColorPallete.accentColor,
        ),
        SizedBox(height: 20),
        Text(
          'Welcome Back',
          style: TextStyle(
            color: ColorPallete.accentColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Sign in to continue',
          style: TextStyle(
            color: ColorPallete.whiteColor,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
