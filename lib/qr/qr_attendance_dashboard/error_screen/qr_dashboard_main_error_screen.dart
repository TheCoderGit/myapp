import 'package:flutter/material.dart';

class QrDashboardMainErrorScreen extends StatelessWidget {
  const QrDashboardMainErrorScreen({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(errorText),
      ),
    );
  }
}
