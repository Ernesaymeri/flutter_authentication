import 'package:flutter_authentication/respositories/geolocation/base_geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationRepository extends BaseGeoLocationRepositor {
  GeolocationRepository();

  @override
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
