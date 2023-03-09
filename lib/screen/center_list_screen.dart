import 'package:flutter/material.dart';
import 'package:with_wall/component/search.dart';
import 'package:with_wall/const/colors.dart';
import 'package:with_wall/component/center_info.dart';

class CenterListScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  CenterListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Search(),
            ),
            Expanded(
              flex: 15,
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  children: numbers
                      .map(
                        (e) => CenterInfo(
                          centerNumber: e,
                        ),
                      ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderCenter(e) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: PRIMARY_COLOR),
      ),
      child: Center(
        child: Text(e.toString()),
      ),
    );
  }
}
