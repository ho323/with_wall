import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:with_wall/component/comment.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Feed extends StatefulWidget {
  final int index;

  const Feed({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  VideoPlayerController? controller;
  Future<void>? _initializeVideoPlayerFuture;
  bool isFavorite = false;

  void initPlayer() async {
    final url = await getVideo();
    controller = VideoPlayerController.network(url);
    _initializeVideoPlayerFuture = controller!.initialize();
    controller!.setLooping(true);

    setState(() {});
  }

  Future<String> getVideo() async {
    try {
      int i = 0;

      final storageRef = FirebaseStorage.instanceFor(
          bucket: "gs://with-wall-ca104.appspot.com/").ref();
      final listVideo = await storageRef.child("video/").listAll();
      final videoItems = listVideo.items;
      final maxLength = videoItems.length;
      widget.index < maxLength ? i = widget.index : i = maxLength -1;
      final pathReference = videoItems[i];

      String videoURL = await pathReference.getDownloadURL();

      print(i);

      return videoURL;
    } on FirebaseException catch (e) {
      print(e);
    }
    return '';
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 400,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _RenderTop(),
          SizedBox(height: 5),
          _RenderVideo(context),
          SizedBox(height: 5),
          _RenderBottom(),
        ],
      ),
    );
  }

  Widget _RenderTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            print('유저 프로필 스크린 이동');
          },
          child: Row(
            children: [
              Icon(Icons.person),
              Text('닉네임'),
            ],
          ),
        ),
        Row(
          children: [
            Text('2023년 3월 12일'),
            SizedBox(width: 10),
          ],
        ),
      ],
    );
  }

  Widget _RenderVideo(context) {
    bool isPlaying = false;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 270,
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
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
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _RenderBottom() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print('좋아요 클릭');
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
                Text(' 좋아요 32개'),
              ],
            ),
            GestureDetector(
              onTap: () {
                print('센터 정보 스크린 이동');
              },
              child: Row(
                children: [
                  Icon(Icons.place, size: 15),
                  Text('센터 위치'),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Comment(),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.green,
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
