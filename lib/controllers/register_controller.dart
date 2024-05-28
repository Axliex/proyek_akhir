import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/user.dart';
import '../screens/login/login_page.dart';

class RegisterController {
  void register(BuildContext context, String name, String city, String address,
      String phone, String email, String password) async {
    final usersBox = await Hive.openBox<User>('userBox');

    // Check if email already exists
    final userExists = usersBox.values.any((user) => user.email == email);
    if (userExists) {
      print('Email already exists!');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registration Failed'),
            content: Text('Email already exists!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    User newUser = User(
      name,
      city,
      address,
      phone,
      email,
      password,
    );

    await usersBox.add(newUser);

    print('Register successful!');
    for (var user in usersBox.values) {
      print(
          'Name: ${user.name}, Email: ${user.email}, City: ${user.city}, Address: ${user.address}, Phone: ${user.phone}, Password: ${user.password}');
    }

    // Lanjutkan ke halaman login
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
