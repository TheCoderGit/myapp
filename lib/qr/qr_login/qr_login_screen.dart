import 'package:flutter/material.dart';
import 'package:myapp/qr/qr_attendance_dashboard/qr_dashboard_main_page.dart';
import 'package:myapp/users/admins/data/admin_local_data.dart';

/// the windows runner is modified to open the screen is a specific size
class QrLoginScreen extends StatefulWidget {
  const QrLoginScreen({super.key});

  @override
  State<QrLoginScreen> createState() => _QrLoginScreenState();
}

class _QrLoginScreenState extends State<QrLoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  AdminLocalData adminLocalData = AdminLocalData();

  @override
  void initState() {
    _checkFirstRun();
    super.initState();
  }

  _checkFirstRun() async {
    var admins = await adminLocalData.getAdmins();
    if (admins.isEmpty) {
      _setFirstTimeAdmin();
    }
  }

  _setFirstTimeAdmin() {
    showDialog(
        context: context,
        builder: (context) {
          TextEditingController name = TextEditingController();
          TextEditingController pass = TextEditingController();

          var formKey = GlobalKey<FormState>();

          return AlertDialog(
            icon: const Icon(
              Icons.warning,
              color: Colors.amber,
              size: 32,
            ),
            backgroundColor: Colors.green[50],
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                    "No Admin user is set for the System. please insert one"),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: pass,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                      ],
                    )),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  child: MaterialButton(
                      mouseCursor: SystemMouseCursors.click,
                      color: Colors.green,
                      elevation: 4,
                      onPressed: () async {
                        formKey.currentState?.validate();

                        adminLocalData.insertAdmin(
                            {'name': name.text, 'pass': pass.text});
                        Navigator.pop(context);
                      },
                      child: const Text("Insert")),
                )
              ],
            ),
          );
        });
  }

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
            onPressed: () async {
              if (await loginIsValid(nameController.text)) {
                if (context.mounted) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const QRDashboardLandingPage()));
                }
              } else {
                if (context.mounted) {
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
              }
            },
            child: const Text("Login"),
          )
        ],
      ),
    );
  }

  Future<bool> loginIsValid(String username) async {
    var name = await adminLocalData.getAdminByUserName(username);

    return name[0]['name'] == nameController.text &&
        name[0]['pass'] == passController.text;
  }
}
