import 'package:noorish_app/hooks/barcode_api.dart';

class NutrientData {
  final String name;
  final double currentValue;
  final double maxValue;

  NutrientData(
      {required this.name, required this.currentValue, required this.maxValue});
}
