import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../add_post_page.dart';

class HomeListItem extends StatelessWidget {
  final AddDetail post;
  const HomeListItem({Key? key, required this.post}) : super(key: key);

  String formatReservedAt(DateTime date) {
    return DateFormat('yy.MM.dd HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: post.images.isNotEmpty
                  // 이 부분 이미지 피커 들어오면 수정되어야함
                  ? Image.network(post.images.first, fit: BoxFit.cover)
                  : Icon(Icons.image, color: Colors.grey[300]),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(post.restName, style: TextStyle(fontSize: 14)),
                  SizedBox(height: 4),
                  Text(
                    post.description,
                    style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.grey[400],
                      ),
                      SizedBox(width: 4),
                      Text(
                        formatReservedAt(post.reservedAt),
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
