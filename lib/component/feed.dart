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
        padding: EdgeInsets.all(20),
        height: 400,
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: PRIMARY_COLOR,
        //   ),
        //   color: Colors.white,
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RenderCircle(),
                    Text('닉네임'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.place, size: 15),
                    Text('센터 위치'),
                    SizedBox(width: 30),
                  ],
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              color: PRIMARY_COLOR,
              child: Center(
                child: Text('썸네일'),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('좋아요'),
                      ],
                    ),
                    Row(
                      children: [
                        RenderCircle(),
                        RenderCircle(),
                        RenderCircle(),
                        SizedBox(width: 30),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget RenderCircle() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          width: 20.0,
          height: 20.0,
        ),
        SizedBox(width: 5),
      ],
    );
  }
}
