import 'package:flutter/material.dart';
import 'package:with_wall/const/colors.dart';

class CenterInfoScreen extends StatelessWidget {
  final int centerNumber;

  const CenterInfoScreen({
    required this.centerNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Center Info Screen',
        ),
      ),
    );
  }
}
