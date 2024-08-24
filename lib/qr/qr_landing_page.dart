import 'package:flutter/material.dart';
import 'package:myapp/qr/qr_generator_page.dart';
import 'package:myapp/qr/qr_reader_page.dart';

class QRLandingPage extends StatefulWidget {
  const QRLandingPage({super.key});

  @override
  State<QRLandingPage> createState() => _QRLandingPageState();
}

class _QRLandingPageState extends State<QRLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Attendance"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: const Text(
              '''The solution will contain two functions.
the first one will be for the generation of QR code. 
and the second is for scanning the QR code''',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
              color: Colors.amber,
              minWidth: MediaQuery.of(context).size.width * 0.8,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QRCodeGenerator()));
              },
              child: const Text("Generate a Code")),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
              color: Colors.blue,
              minWidth: MediaQuery.of(context).size.width * 0.8,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const QRCodeScanner()));
              },
              child: const Text("scan a Code")),
        ],
      ),
    );
  }
}
