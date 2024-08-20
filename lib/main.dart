import 'package:flutter/material.dart';
import 'package:myapp/qr/qr_login/qr_login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: 
        QrLoginScreen(),
      title: "The Coder Test lab",
    );
  }
}