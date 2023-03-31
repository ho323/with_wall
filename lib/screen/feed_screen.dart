import 'package:flutter/material.dart';
import 'package:with_wall/component/feed.dart';
import 'package:firebase_storage/firebase_storage.dart';


class FeedScreen extends StatefulWidget {
  FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int postNumber = 10;

  Future<void> getItems() async {
    final storageRef =
    FirebaseStorage.instanceFor(bucket: "gs://with-wall-ca104.appspot.com/")
        .ref();
    final listVideo = await storageRef.child("video/").listAll();
    postNumber = listVideo.items.length;

    // listVideo.addListner();
  }

  @override
  void initState() {
    super.initState();
    getItems();
  }

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
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: postNumber,
                itemBuilder: (context, index) {
                  return Feed(index: index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
