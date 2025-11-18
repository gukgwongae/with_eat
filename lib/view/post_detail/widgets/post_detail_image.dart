import 'dart:convert';

import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final String images;

  const ImageSection({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 16 / 9, child: _buildImage(images));
  }

  Widget _buildImage(String source) {
    if (source.startsWith('http')) {
      return Image.network(
        source,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image),
      );
    }
    try {
      final bytes = base64Decode(source);
      return Image.memory(
        bytes,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image),
      );
    } catch (_) {
      return const Icon(Icons.broken_image);
    }
  }
}
