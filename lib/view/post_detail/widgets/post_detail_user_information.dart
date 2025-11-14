import 'package:flutter/material.dart';

class UserSection extends StatelessWidget {
  final String hostId;
  final String hostProfileImage;

  const UserSection({
    super.key,
    required this.hostId,
    required this.hostProfileImage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(hostProfileImage),
      ),
      title: Text(hostId),
    );
  }
}