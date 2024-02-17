import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  final String name;
  final int quantity;
  final int quantityConsumed;
  final int protein;
  final int carbs;
  final int calories;
  final int fats;
  final double servingSize;

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
}
