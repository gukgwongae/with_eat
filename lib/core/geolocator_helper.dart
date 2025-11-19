import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocation {
  final double latitude;
  final double longitude;
  final String address;

  const CurrentLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}

class GeolocatorHelper {
  static Future<Position?> getPosition() async {
    final permission = await Geolocator.checkPermission();
    // 1. 현재 권한이 허용되지 않았을때 권한 요청하기
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // 2. 권한 요청 후 결과가 거부일 때 리턴하기
      final permission2 = await Geolocator.requestPermission();
      if (permission2 == LocationPermission.denied ||
          permission2 == LocationPermission.deniedForever) {
        return null;
      }
    }

    // 3. Geolocator 로 위치 가져와서 리턴
    final position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      ),
    );
    return position;
  }

  static Future<CurrentLocation?> getCurrentLocation() async {
    try {
      final position = await getPosition();
      if (position == null) {
        return null;
      }
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isEmpty) {
        return null;
      }
      final placemark = placemarks.first;
      final components = <String?>[
        placemark.administrativeArea,
        placemark.locality,
        placemark.subLocality,
        placemark.street,
        placemark.name,
      ].where((value) => value != null && value!.trim().isNotEmpty).toList();
      if (components.isEmpty) {
        return null;
      }
      return CurrentLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        address: components.join(' '),
      );
    } catch (e) {
      return null;
    }
  }

  static Future<String?> getCurrentAddress() async {
    final location = await getCurrentLocation();
    return location?.address;
  }
}
