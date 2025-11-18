import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:with_eat/model/post_detail/post_detail.dart';

class HomeListItem extends StatelessWidget {
  final PostDetail post;
  final VoidCallback? onTap;
  const HomeListItem({Key? key, required this.post, this.onTap})
    : super(key: key);

  String formatReservedAt(DateTime date) {
    return DateFormat('yy.MM.dd HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Color(0xFFFBF4EE),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                    ? Image.network(
                        post.images.first,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.broken_image, color: Colors.grey[300]),
                      )
                    : Icon(Icons.image, color: Colors.grey[300]),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.postTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
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
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
