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
                  Ingredient ingredient;
                  if (barcodes.isNotEmpty) {
                    final barcode = barcodes[0].displayValue;
                    ingredient = Ingredient(barcode: barcodeString);
                    ingredient.updateNutriments();
                    setState(() {
                      isScanning = false;
                      barcodeString = barcode.toString();
                    });
                    ingredients.add(ingredient);
                  }
                },
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    Ingredient ingredient = ingredients[index];
                    return Card(
                      child: ListTile(
                        title: Text(ingredient.name),
                        subtitle: Text(
                            'Calories: ${ingredient.calories}, Protein: ${ingredient.protein}, Carbs: ${ingredient.carbs}, Fats: ${ingredient.fats}'),
                      ),
                    );
                  },
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => isScanning = !isScanning),
          child: Icon(isScanning ? Icons.stop : Icons.camera_alt),
        ));
  }
}
