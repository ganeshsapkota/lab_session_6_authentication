// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Strength Checker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PasswordChecker(),
    );
  }
}

class PasswordChecker extends StatefulWidget {
  @override
  _PasswordCheckerState createState() => _PasswordCheckerState();
}

class _PasswordCheckerState extends State<PasswordChecker> {
  late String password;
  String passwordStrength = 'Too Short';
  Color passwordStrengthColor = Colors.red;

  void checkPasswordStrength(String password) {
    int strength = 0;
    if (password.length > 8) {
      strength++;
    }
    if (password.contains(RegExp(r'[A-Z]'))) {
      strength++;
    }
    if (password.contains(RegExp(r'[a-z]'))) {
      strength++;
    }
    if (password.contains(RegExp(r'[0-9]'))) {
      strength++;
    }
    if (password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      strength++;
    }

    switch (strength) {
      case 0:
      case 1:
        passwordStrength = "Too Weak 🥲";
        passwordStrengthColor = Colors.red;
        break;
      case 2:
        passwordStrength = 'Weak 🥺';
        passwordStrengthColor = Colors.orange;
        break;
      case 3:
        passwordStrength = 'Good 🙂';
        passwordStrengthColor = Colors.yellow;
        break;
      case 4:
        passwordStrength = 'Very Good 😍';
        passwordStrengthColor = Colors.green;
        break;
      case 5:
        passwordStrength = 'Strong 👌';
        passwordStrengthColor = Color.fromARGB(255, 2, 60, 108);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Strength Checker'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  "https://t4.ftcdn.net/jpg/05/20/50/87/360_F_520508759_aL7ZcAgmE3Sje6TX3ynC6jYHcccTr5ph.jpg",
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              decoration:
                  const InputDecoration(hintText: 'Enter your password'),
              onChanged: (value) {
                password = value;
                checkPasswordStrength(password);
                setState(() {});
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Password Strength: $passwordStrength',
              style: TextStyle(
                  color: passwordStrengthColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
