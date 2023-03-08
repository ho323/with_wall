import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  final int postNumber;

  const PostScreen({
    required this.postNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Post'),
      ),
    );
  }
}
