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
    final hasProfileImage = hostProfileImage.trim().isNotEmpty;

    return ListTile(
      leading: hasProfileImage
          ? CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(hostProfileImage),
            )
          : const CircleAvatar(radius: 24, child: Icon(Icons.person, size: 30)),
      title: Text(hostId),
    );
  }
}
