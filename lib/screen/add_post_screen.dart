import 'package:flutter/material.dart';
import 'package:with_wall/const/colors.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '운동 기록',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              _AddNewVideo(),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.place),
                  Text('센터 위치 등록'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.circle),
                  Text('난이도 선택'),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                color: PRIMARY_COLOR,
                child: Center(
                  child: Text('영상 등록'),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('취소'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('저장'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _AddNewVideo() {
    return Container(
      height: 270,
      color: PRIMARY_COLOR,
      child: Center(
        child: Text('영상 등록'),
      ),
    );
  }
}
