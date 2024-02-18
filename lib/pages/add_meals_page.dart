import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:noorish_app/hooks/barcode_api.dart'; // Make sure this path is correct
import 'package:noorish_app/models/day.dart'; // Make sure this path is correct
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:noorish_app/hooks/barcode_api.dart';
import 'package:noorish_app/models/ingredient.dart';

// Define the StatefulWidget
class AddMeal extends StatefulWidget {
  final Day day;

  // No need to pass Day day again if it's already included in the required parameters
  const AddMeal(this.day, {super.key});

  @override
  _AddMealState createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  bool isScanning = false;
  List<Ingredient> ingredients = [];
  String barcodeString = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Meal')),
      body: isScanning
          ? MobileScanner(
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                if (barcodes.isNotEmpty) {
                  final barcode = barcodes[0].displayValue;
                  setState(() {
                    isScanning = false;
                    barcodeString = barcode.toString();
                    ingredients.addAll(fetchProductNutriments(barcodeString)
                        as Iterable<Ingredient>);
                  });
                }
              },
            )
          : Center(child: Text('barcode')),
    );
  }
}
