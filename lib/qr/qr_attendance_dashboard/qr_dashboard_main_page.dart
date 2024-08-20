import 'package:flutter/material.dart';
import 'package:myapp/qr/qr_attendance_dashboard/error_screen/qr_dashboard_main_error_screen.dart';
import 'package:myapp/qr/qr_attendance_dashboard/small_screen/qr_dashboard_main_small.dart';

class QRDashboardLandingPage extends StatelessWidget {
  const QRDashboardLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (size.width > 600) {
          return const QrDashboardMainErrorScreen(
              errorText: "Screen size is bigger than expected");
        } else if (size.width < 400) {
          return const QrDashboardMainErrorScreen(
              errorText: "Screen size is smaller than expected");
        } else {
          return const QrDashboardMainSmall();
        }
      },
    );
  }
}
