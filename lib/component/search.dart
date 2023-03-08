import 'package:flutter/material.dart';
import 'package:with_wall/const/colors.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        color: PRIMARY_COLOR,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search),
        ],
      ),
    );
  }
}
