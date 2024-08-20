import 'package:flutter/material.dart';
import 'package:myapp/qr/qr_attendance_dashboard/qr_dashboard_main_page.dart';

class QrLoginScreen extends StatefulWidget {
  const QrLoginScreen({super.key});

  @override
  State<QrLoginScreen> createState() => _QrLoginScreenState();
}

class _QrLoginScreenState extends State<QrLoginScreen> {
  TextEditingController nameController = TextEditingController(text: "name");
  TextEditingController passController = TextEditingController(text: "pass");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text(
              "Welcome to the QR attendance System",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: nameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: passController,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              if (loginIsValid()) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QRDashboardLandingPage()));
              } else {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("OK"))
                        ],
                        content: const Text("Invalid name or Password"),
                        title: const Text("Error"),
                      );
                    });
              }
            },
            child: const Text("Login"),
          )
        ],
      ),
    );
  }

  bool loginIsValid() {
    return nameController.text == "name" && passController.text == "pass";
  }
}
