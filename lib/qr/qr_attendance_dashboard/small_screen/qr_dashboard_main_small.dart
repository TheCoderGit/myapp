import 'package:flutter/material.dart';
import 'package:myapp/qr/qr_generator_page.dart';

class QrDashboardMainSmall extends StatelessWidget {
  const QrDashboardMainSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        minRadius: 25,
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        child: Text(
                          "N",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                          Text("name")
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.exit_to_app))
                ],
              ),
            ),
            const Text(
              "Qr Attendance System Main Dashboard",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Attendance of ${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}",
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Text("Users"),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Card(
                          color: Colors.green.shade50,
                          child: const ListTile(
                            title: Text("Ahmed Hassan Salem"),
                            subtitle: Text("Mass Media - Grade 4"),
                            leading: Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                            trailing: Icon(
                              Icons.warning,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.green.shade50,
                          child: ListTile(
                            title: const Text("Aly Ghobashy"),
                            subtitle: const Text("Computer Scinse - Grade 4"),
                            leading: const Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                            trailing: Icon(
                              Icons.check,
                              color: Colors.green[500],
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.green.shade50,
                          child: ListTile(
                            title: const Text("Mohamed Allam"),
                            subtitle: const Text("Computer Scince - Grade 4"),
                            leading: const Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                            trailing: Icon(
                              Icons.check,
                              color: Colors.green[500],
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.green.shade50,
                          child: ListTile(
                            title: const Text("Ahmed El Zohairy"),
                            subtitle: const Text("Computer Scince - Grade 4"),
                            leading: const Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                            trailing: Icon(
                              Icons.check,
                              color: Colors.green[500],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: MaterialButton(
                            color: Colors.green,
                            onPressed: () {},
                            child: const Text("User Managment Page"),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const QRCodeGenerator()));
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code), label: "QR attendance"),
          BottomNavigationBarItem(
              icon: Icon(Icons.device_unknown), label: "Devices"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "settings"),
        ],
      ),
    );
  }
}
