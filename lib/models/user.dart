import 'package:geolocator/geolocator.dart';

class User {
  final String userName;
  final String sex;
  final double height;
  final double weight;
  final double bmi;
  final Future<Position> location;

  User({
    required this.userName,
    required this.sex,
    required this.height, // Height in inches
    required this.weight, // Weight in pounds
    required Future<Position> location,
  })  : location = getLocation(),
        bmi = _calculateBMI(weight, height); // Calculate BMI

  User.blank()
      : userName = '',
        sex = '',
        height = 0,
        weight = 0,
        bmi = 0,
        location = Future.value(Position(
          latitude: 0,
          longitude: 0,
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0,
          timestamp: DateTime.now(),
          altitudeAccuracy: 0,
          headingAccuracy: 0,
        ));

  static double _calculateBMI(double weight, double height) {
    double heightInM = height * 0.0254; // Convert inches to meters
    double weightInKg = weight * 0.453592; // Convert pounds to kilograms
    return weightInKg / (heightInM * heightInM);
  }

  static Future<Position> getLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
