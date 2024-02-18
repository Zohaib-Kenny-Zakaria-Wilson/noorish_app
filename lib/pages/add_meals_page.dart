import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:noorish_app/hooks/barcode_api.dart'; // Make sure this path is correct
import 'package:noorish_app/models/day.dart'; // Make sure this path is correct
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:noorish_app/hooks/barcode_api.dart';

// Define the StatefulWidget
class AddMeal extends StatefulWidget {
  final Day day;

  const AddMeal({Key? key, required this.day}) : super(key: key);

  @override
  _AddMealState createState() => _AddMealState(day);
}

// Define the State class
class _AddMealState extends State<AddMeal> {
  final Day day;
  bool isScanning = true; // State variable to control scanner activity

  _AddMealState(this.day);

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
                  fetchProductInfo(barcode.rawValue!); // Fetch product info

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
