import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerPage extends StatelessWidget {
  const QRScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
        backgroundColor: Colors.deepPurple,
      ),
      body: MobileScanner(
onDetect: (BarcodeCapture capture) {
  final List<Barcode> barcodes = capture.barcodes;

  for (final barcode in barcodes) {
    final String? code = barcode.rawValue;

    if (code != null) {
      print("QR Code: $code");

      Navigator.pop(context, code);
      break; // مهم عشان ما يقراش اكتر من مرة
    }
  }
},
      ),
    );
  }
}