import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('댓글 3개'),
                    Column(
                      children: [
                        SizedBox(height: 15),
                        Container(
                          width: MediaQuery.of(context).size.width-160,
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(Icons.person),
                            Text('  댓글'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              insetPadding: EdgeInsets.fromLTRB(0, 80, 0, 100),
            );
          },
        );
      },
      child: Row(
        children: [
          Icon(Icons.list),
          Text(' 댓글 3개'),
        ],
      ),
    );
  }
}
