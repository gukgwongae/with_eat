import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import '../../../model/post_detail/post_detail.dart';

class MapSection extends StatelessWidget {
  final Location location;

  const MapSection({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    final target = NLatLng(location.lat, location.lng);

    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: NaverMap(
        options: NaverMapViewOptions(
          initialCameraPosition: NCameraPosition(
            target: target,
            zoom: 16,
          ),
        ),
        onMapReady: (controller) {
          final marker = NMarker(id: 'store-marker', position: target);

          controller.addOverlay(marker);
        },
      ),
    );
  }
}
