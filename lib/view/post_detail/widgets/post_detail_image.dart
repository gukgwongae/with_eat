import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final String images;

  const ImageSection({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Image.network(
        images,
        fit: BoxFit.cover,
      ),
    );
  }
}