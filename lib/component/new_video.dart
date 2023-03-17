import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:with_wall/const/colors.dart';

class AddNewVideo extends StatefulWidget {
  const AddNewVideo({Key? key}) : super(key: key);

  @override
  State<AddNewVideo> createState() => _AddNewVideoState();
}

class _AddNewVideoState extends State<AddNewVideo> {
  XFile? video;
  VideoPlayerController? controller;

  @override
  void dispose() {
    if(controller != null) controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      decoration: BoxDecoration(
        border: Border.all(color: PRIMARY_COLOR, width: 3.0),
      ),
      child: video == null ? renderEmpty() : renderVideo(),
    );
  }

  Widget renderEmpty() {
    return GestureDetector(
      onTap: () async {
        final video = await ImagePicker().pickVideo(
          source: ImageSource.gallery,
          maxDuration: Duration(seconds: 60),
        );
        if (video != null) {
          setState(() {
            this.video = video;
            controller = VideoPlayerController.file(
              File(video.path),
            );
            controller!.initialize();
            controller!.setLooping(true);
          });
        }
      },
      child: const Center(
        child: Icon(
          Icons.add_circle,
          color: PRIMARY_COLOR,
          size: 50.0,
        ),
      ),
    );
  }

  Widget renderVideo() {
    bool isPlaying = false;
    if (controller != null) {
      return GestureDetector(
        onTap: () {
          if (!isPlaying) {
            controller!.play();
            isPlaying = true;
          } else {
            controller!.pause();
            isPlaying = false;
          }
        },
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
