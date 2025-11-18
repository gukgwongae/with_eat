import 'package:flutter/material.dart';

class AddPostTitleLabel extends StatelessWidget {
  final String title;

  const AddPostTitleLabel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title),
    );
  }
}


