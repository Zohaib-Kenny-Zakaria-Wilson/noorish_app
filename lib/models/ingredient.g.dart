// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      protein: json['protien'] as int,
      carbs: json['carbs'] as int,
      calories: json['calories'] as int,
      fats: json['fats'] as int,
      servingSize: (json['servingSize'] as num).toDouble(),
      quantityConsumed: json['quantityConsumed'] as int,
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'quantityConsumed': instance.quantityConsumed,
      'protien': instance.protein,
      'carbs': instance.carbs,
      'calories': instance.calories,
      'fats': instance.fats,
      'servingSize': instance.servingSize,
    };
