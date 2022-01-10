import 'package:geolocator/geolocator.dart';

abstract class BaseGeoLocationRepositor{
  Future<Position?> getCurrentLocation() async {}
}