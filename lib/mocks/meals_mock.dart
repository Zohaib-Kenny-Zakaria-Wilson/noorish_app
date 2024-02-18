import 'package:noorish_app/models/ingredient.dart';
import 'package:noorish_app/models/meal.dart';

mixin MockMeal implements Meal {
  static final List<Meal> meals = [
    Meal(
      name: 'Spaghetti Carbonara',
      ingredientsList: [
        Ingredient(
          name: 'Spaghetti',
          quantity: 2,
          quantityConsumed: 1,
          protein: 10,
          carbs: 30,
          calories: 200,
          fats: 5,
          servingSize: 100.0,
        ),
        Ingredient(
          name: 'Eggs',
          quantity: 2,
          quantityConsumed: 2,
          protein: 12,
          carbs: 2,
          calories: 140,
          fats: 10,
          servingSize: 50.0,
        ),
        // Add more ingredients as needed
      ],
    ),
    Meal(
      name: 'Chicken Stir-Fry',
      ingredientsList: [
        Ingredient(
          name: 'Chicken Breast',
          quantity: 300,
          quantityConsumed: 250,
          protein: 25,
          carbs: 0,
          calories: 150,
          fats: 3,
          servingSize: 150.0,
        ),
        Ingredient(
          name: 'Bell Pepper',
          quantity: 150,
          quantityConsumed: 100,
          protein: 2,
          carbs: 5,
          calories: 30,
          fats: 0,
          servingSize: 75.0,
        ),
        // Add more ingredients as needed
      ],
    ),
    // Add more meals as needed
  ];
}
