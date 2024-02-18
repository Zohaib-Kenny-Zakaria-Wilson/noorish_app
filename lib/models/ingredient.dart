import 'package:json_annotation/json_annotation.dart';
import 'package:noorish_app/hooks/barcode_api.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  final String name;
  final int quantity;
  final int quantityConsumed;
  double protein;
  double carbs;
  double calories;
  double fats;
  final double servingSize;
  final String barcode = '5449000214911';

  factory Ingredient.fromJson(
          Map<String, dynamic>
              json) => // converts json to actual instianiated objects
      _$IngredientFromJson(json);

  Ingredient({
    required this.name,
    required this.quantity,
    required this.quantityConsumed,
    required this.protein,
    required this.carbs,
    required this.calories,
    required this.fats,
    required this.servingSize,
  });

  Future<void> updateNutriments() async {
    Map nutriments = await fetchProductNutriments(this.barcode);
    protein = nutriments['proteins'];
    carbs = nutriments['carbohydrates'];
    calories = nutriments['energy-kcal'];
    fats = nutriments['fat'];
  }
}
