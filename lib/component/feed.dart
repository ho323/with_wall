import 'package:flutter/material.dart';
import 'package:with_wall/const/colors.dart';
import 'package:with_wall/screen/post_screen.dart';

class Feed extends StatelessWidget {
  final int postNumber;

  const Feed({
    required this.postNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PostScreen(
              postNumber: postNumber,
            ),
          ),
        );
      },
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(
            color: PRIMARY_COLOR,
          ),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            postNumber.toString(),
          ),
        ),
      ),
    );
  }
}
