import 'package:noorish_app/models/ingredient.dart';
import 'package:noorish_app/models/meal.dart';

mixin MockMeal implements Meal {
  static final List<Meal> meals = [
    Meal(
      name: 'Spaghetti Carbonara',
      ingredientsList: [
        Ingredient(barcode: '8076809529433'), // pasta
        Ingredient(barcode: '8000500032003'), // eggs
        // Add more ingredients as needed
      ],
    ),
    // Add more meals as needed
  ];
}
