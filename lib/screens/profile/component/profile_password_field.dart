import 'package:flutter/material.dart';
import 'package:proyek/controllers/colorpalette.dart';

class ProfilePasswordField extends StatefulWidget {
  final String password;

  ProfilePasswordField({required this.password});

  @override
  _ProfilePasswordFieldState createState() => _ProfilePasswordFieldState();
}

class _ProfilePasswordFieldState extends State<ProfilePasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Password : ',
          style: TextStyle(fontWeight: FontWeight.bold, color: ColorPallete.accentColor),
        ),
        Expanded(
          child: Text(
            _isPasswordVisible ? widget.password : '*' * widget.password.length,
            style: TextStyle(color: ColorPallete.accentColor),
          ),
        ),
        IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: ColorPallete.accentColor,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ],
    );
  }
}
