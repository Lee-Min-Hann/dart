import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

extension NavigatorExtensions on BuildContext {
  void navigateToHome() {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void navigateToLogin() {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}

// Navigator.pushReplacement(
//   context,
//   MaterialPageRoute(builder: (context) => HomeScreen()),
// );