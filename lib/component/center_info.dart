import 'package:flutter/material.dart';
import 'package:with_wall/const/colors.dart';
import 'package:with_wall/screen/center_info_screen.dart';

class CenterInfo extends StatelessWidget {
  final int centerNumber;

  const CenterInfo({
    required this.centerNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CenterInfoScreen(
              centerNumber: centerNumber,
            ),
          ),
        );
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: PRIMARY_COLOR,
          ),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            centerNumber.toString(),
          ),
        ),
      ),
    );
  }
}
