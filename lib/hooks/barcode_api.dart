import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:noorish_app/models/ingredient.dart';

Future<String?> fetchProductName(String barcode) async {
  final String url =
      'https://world.openfoodfacts.org/api/v0/product/$barcode.json';
  try {
    final response = await http.get(Uri.parse(url),
        headers: {"User-Agent": "YourApp/Version (Platform; Contact Info)"});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) {
        return 'Product not found';
      } else {
        return data['product']['product_name']; // Return the product name
      }
    } else {
      return 'Error fetching product info';
    }
  } catch (e) {
    return 'Error fetching product info: $e';
  }
}

Future<Map> fetchProductNutriments(String barcode) async {
  final String url =
      'https://world.openfoodfacts.org/api/v0/product/$barcode.json';
  final response = await http.get(Uri.parse(url),
      headers: {"User-Agent": "YourApp/Version (Platform; Contact Info)"});

  if (response.statusCode != 200) {
    throw response.body;
  }
  final data = jsonDecode(response.body);
  return data['product']['nutriments']; // Return the ingredient
}
