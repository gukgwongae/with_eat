import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final List<String> images;

  const ImageSection({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.black12,
          alignment: Alignment.center,
          child: const Text('이미지 없음'),
        ),
      );
    }

    final image = images.first;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}