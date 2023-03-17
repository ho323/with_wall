import 'package:flutter/material.dart';
import 'package:with_wall/component/feed.dart';

class FeedScreen extends StatelessWidget {
  final List<int> numbers = List.generate(8, (index) => index);

  FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: numbers
                      .map(
                        (e) => Feed(
                          postNumber: e,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
