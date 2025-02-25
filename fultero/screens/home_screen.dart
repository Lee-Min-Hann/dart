import 'package:flutter/material.dart';
import '../utils/navigator_extensions.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
        leading: IconButton( // Tombol logout di kiri
          icon: Icon(Icons.logout),
          onPressed: () {
            context.navigateToLogin(); // Kembali ke halaman login
          },
        ),
      ),
      body: Center(child: Text('Welcome to Main Page!')),
    );
  }
}
