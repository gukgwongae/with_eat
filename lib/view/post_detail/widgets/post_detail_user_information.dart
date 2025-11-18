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
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: hostProfileImage.startsWith('http')
                    ? Image.network(
                        hostProfileImage,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.person, size: 30),
                      )
                    : Image.asset(
                        hostProfileImage,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.person, size: 30),
                      ),
              ),
            )
          : const CircleAvatar(radius: 24, child: Icon(Icons.person, size: 30)),
      title: Text(hostId),
    );
  }
}
