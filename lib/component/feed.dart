import 'package:flutter/material.dart';
import 'package:with_wall/const/colors.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        color: PRIMARY_COLOR,
      ),
    );
  }
}
