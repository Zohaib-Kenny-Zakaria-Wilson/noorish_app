import 'package:noorish_app/models/user.dart';
// import 'package:geolocator/geolocator.dart';

class MockUser extends User {
  MockUser()
      : super(
          userName: 'Kenny',
          sex: 'Male',
          height:
              68.0, // Assuming this is the intended representation (inches to meters conversion happens inside User)
          weight:
              230.0, // Assuming this is the intended representation (pounds to kilograms conversion happens inside User)
          long: 96.681679,
          lat: 40.806862,
        );
}
