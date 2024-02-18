import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:noorish_app/hooks/barcode_api.dart'; // Make sure this path is correct
import 'package:noorish_app/models/day.dart'; // Make sure this path is correct
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:noorish_app/hooks/barcode_api.dart';

// Define the StatefulWidget
class AddMeal extends StatefulWidget {
  final Day day;

  // No need to pass Day day again if it's already included in the required parameters
  const AddMeal(this.day, {super.key});

  @override
  _AddMealState createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  bool isScanning = true; // State variable to control scanner activity

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner')),
      body: isScanning
          ? MobileScanner(
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                if (barcodes.isNotEmpty) {
                  final barcode = barcodes[0];
                  debugPrint('Barcode found! ${barcode.rawValue}');
                  fetchProductName(barcode.rawValue!); // Fetch product info

                  setState(() {
                    isScanning =
                        false; // Stop scanning after a barcode is detected
                  });
                }
              },
            )
          : Center(child: Text('barcode')),
    );
  }
}
