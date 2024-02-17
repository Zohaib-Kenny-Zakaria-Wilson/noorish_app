import 'package:flutter_test/flutter_test.dart';
import 'package:noorish_app/mocks/user_mock.dart';
import 'package:noorish_app/models/user.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // Add this line
  test('test user', () {
    User kenny = MockUser();
    // Expected BMI value, which should be calculated by the User class
    final double expectedBMI = 34.97; // Rounded to 2 decimal places

    // Use closeTo matcher to check if the values are close within a tolerance
    expect(kenny.bmi, closeTo(expectedBMI, 0.01));
  });
}
