import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:with_wall/const/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:video_compress/video_compress.dart';

class AddPostScreen extends StatefulWidget {
  AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  XFile? video;
  Uint8List? thumbnail;
  String userId = 'ho';

  Future<void> _downscaleVideo(XFile vid) async {
    MediaInfo? mediaInfo = await VideoCompress.compressVideo(
      vid.path,
      quality: VideoQuality.LowQuality,
      deleteOrigin: true, // It's false by default
    );
  }

  Future<Uint8List?> _loadThumbnail(XFile vid) async {
    final thumbnail = await VideoCompress.getByteThumbnail(vid.path,
        quality: 100, // default(100)
        position: -1 // default(-1)
        );
    return thumbnail;
  }

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
              Title(),
              SizedBox(height: 20),
              AddVideo(),
              SizedBox(height: 10),
              CenterLocation(),
              PickLevelColor(),
              SizedBox(height: 10),
              Diary(),
              SizedBox(height: 20),
              BottomButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget Title() {
    return Text(
      '운동 기록',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget AddVideo() {
    return Container(
        height: 270,
        decoration: BoxDecoration(
          border: Border.all(color: PRIMARY_COLOR, width: 3.0),
        ),
        child: GestureDetector(
          onTap: () async {
            final video = await ImagePicker().pickVideo(
              source: ImageSource.gallery,
              maxDuration: Duration(seconds: 60),
            );
            if (video != null) {
              thumbnail = await _loadThumbnail(video);
              setState(() {
                this.video = video;
                _downscaleVideo(video);
              });
            }
          },
          child: thumbnail == null ? renderEmpty() : renderThumbnail(),
        ));
  }

  Widget renderEmpty() {
    return const Center(
      child: Icon(
        Icons.add_circle,
        color: PRIMARY_COLOR,
        size: 50.0,
      ),
    );
  }

  Widget renderThumbnail() {
    if (thumbnail != null) {
      return Container(
        height: 270,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: MemoryImage(thumbnail!),
          ),
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }

  Widget CenterLocation() {
    return Row(
      children: [
        Icon(Icons.place),
        Text('센터 위치 등록'),
      ],
    );
  }

  Widget PickLevelColor() {
    return Row(
      children: [
        Icon(Icons.circle),
        Text('난이도 선택'),
      ],
    );
  }

  Widget Diary() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: PRIMARY_COLOR, width: 3),
      ),
      child: Center(
        child: Text('Diary'),
      ),
    );
  }

  Widget BottomButtons() {
    return Row(
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
            if (video != null) {
              uploadVideo(video!);
              Navigator.of(context).pop();
            } else {}
          },
          child: Text('저장'),
        ),
      ],
    );
  }

  void uploadVideo(XFile vid) async {
    final file = File(vid.path);
    DateTime now = DateTime.now().add(Duration(hours: 9));  // KR utc +9
    String fileName = "${now.year}_${now.month}_${now.day}-"
        "${now.hour}_${now.minute}_${now.second}-$userId.mp4";

    final storageRef = FirebaseStorage.instanceFor(
        bucket: "gs://with-wall-ca104.appspot.com/").ref();
    final mountainsRef = storageRef.child(fileName);
    final mountainVideoRef = storageRef.child("video/$fileName");

    assert(mountainsRef.name == mountainVideoRef.name);
    assert(mountainsRef.fullPath != mountainVideoRef.fullPath);

    try {
      await mountainVideoRef.putFile(file);
      print("upload! $file");
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
