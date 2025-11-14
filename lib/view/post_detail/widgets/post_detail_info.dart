import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  final DateTime reservedAt;
  final String postTitle;
  final String description;
  final String restName;

  const InfoSection({
    super.key,
    required this.reservedAt,
    required this.postTitle,
    required this.description,
    required this.restName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reservedAt.toString(),
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),

          Text(
            postTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          Text(description),
          const SizedBox(height: 16),

          Text(
            restName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}