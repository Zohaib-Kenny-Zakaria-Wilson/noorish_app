class User {
  final String userName;
  final String sex;
  final double height;
  final double weight;
  final double bmi;
  final double long;
  final double lat;

  User({
    required this.userName,
    required this.sex,
    required this.height, // Height in inches
    required this.weight, // Weight in pounds
    required this.long,
    required this.lat,
  }) : bmi = _calculateBMI(weight, height); // Calculate BMI

  User.blank()
      : userName = '',
        sex = '',
        height = 0,
        weight = 0,
        bmi = 0,
        long = 0,
        lat = 0;

  ///Calculates
  static double _calculateBMI(double weight, double height) {
    double heightInM = height * 0.0254; // Convert inches to meters
    double weightInKg = weight * 0.453592; // Convert pounds to kilograms
    return weightInKg / (heightInM * heightInM);
  }
}
