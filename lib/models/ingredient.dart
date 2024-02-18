import 'package:json_annotation/json_annotation.dart';
import 'package:noorish_app/hooks/barcode_api.dart';

@JsonSerializable()
class Ingredient {
  final String name = '';
  int protein = 0;
  int carbs = 0;
  int calories = 0;
  int fats = 0;
  final String barcode;

  Ingredient({required this.barcode});

  Future<void> updateNutriments() async {
    Map nutriments = await fetchProductNutriments(this.barcode);
    protein = nutriments['proteins'];
    carbs = nutriments['carbohydrates'];
    calories = nutriments['energy-kcal'];
    fats = nutriments['fat'];
  }
}
