import 'package:flutter/material.dart';
import '../utils/navigator_extensions.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      context.navigateToLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih agar lebih bersih
      body: Center(
        child: FlutterLogo(
          size: 150, // Ukuran logo Flutter
        ),
      ),
    );
  }
}




