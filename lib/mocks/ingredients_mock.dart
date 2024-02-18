import 'package:noorish_app/models/ingredient.dart';

mixin MockIngredient {
  static final List<Ingredient> ingredients = [
    Ingredient(
      name: 'Chicken Breast',
      quantity: 500,
      quantityConsumed: 200,
      protein: 80,
      carbs: 0,
      calories: 250,
      fats: 5,
      servingSize: 100.0,
    ),
    Ingredient(
      name: 'Brown Rice',
      quantity: 1000,
      quantityConsumed: 300,
      protein: 10,
      carbs: 150,
      calories: 600,
      fats: 5,
      servingSize: 50.0,
    ),
    // Add more mock ingredients as needed
  ];}
