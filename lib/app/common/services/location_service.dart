import 'package:agro_info/app/common/resources/result.dart';
import 'package:geolocator/geolocator.dart';

abstract class ILocationService {
  Future<Result<Position, Exception>> determinePosition();
}

class LocationService implements ILocationService {
  static final LocationService _instance = LocationService._internal();

  LocationService._internal();
  factory LocationService() => _instance;

  @override
  Future<Result<Position, Exception>> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Failure(Exception('O GPS está desativado. Por favor, ative-o.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Failure(Exception('Permissão de localização negada.'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Failure(
        Exception(
          'As permissões de localização estão permanentemente negadas.',
        ),
      );
    }

    var position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.medium,
      ),
    );

    return Success(position);
  }
}
