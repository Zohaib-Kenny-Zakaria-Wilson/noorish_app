import 'package:json_annotation/json_annotation.dart';
import 'package:noorish_app/models/ingredient.dart';

@JsonSerializable()
class Meal {
  final String name;
  final List<Ingredient> ingredientsList;

  Meal({required this.name, required this.ingredientsList});
}
