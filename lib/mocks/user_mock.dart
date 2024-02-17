import 'package:noorish_app/models/user.dart';
import 'package:geolocator/geolocator.dart';

class MockUser extends User {
  MockUser()
      : super(
          userName: 'Kenny',
          sex: 'Male',
          height:
              68.0, // Assuming this is the intended representation (inches to meters conversion happens inside User)
          weight:
              230.0, // Assuming this is the intended representation (pounds to kilograms conversion happens inside User)
          location: Future.value(Position(
            latitude: 40.712776,
            longitude: -74.005974,
            timestamp: DateTime.now(),
            accuracy: 5.0,
            altitude: 30.0,
            heading: 0.0,
            speed: 0.0,
            speedAccuracy: 0.0,
            altitudeAccuracy: 0.0,
            headingAccuracy: 0.0,
            isMocked: true,
          )),
        );
}
