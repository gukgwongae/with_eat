import 'package:flutter/material.dart';
import '../../../model/post_detail/post_detail.dart';

class MapSection extends StatelessWidget {
  final Location location;

  const MapSection({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        '지도: ${location.address}\n'
        '(${location.lat}, ${location.lng})',
        textAlign: TextAlign.center,
      ),
    );
  }
}