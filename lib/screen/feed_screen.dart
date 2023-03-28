import 'package:flutter/material.dart';
import 'package:with_wall/component/feed.dart';
import 'package:firebase_storage/firebase_storage.dart';


class FeedScreen extends StatefulWidget {
  FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  final List<int> numbers = List.generate(8, (index) => index);

  // Future<void> initFeed() async {
  //   final storageRef = FirebaseStorage.instanceFor(bucket: "gs://with-wall-ca104.appspot.com/video").ref();
  //   final videoList = await storageRef.child("video/").listAll();
  //   final videoItems = videoList.items;
  //
  //   print(videoItems);
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   initFeed();
  // }

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
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: numbers
                        .map(
                          (e) => Feed(
                            postNumber: e,
                          ),
                        )
                        .toList(),
                  );
                },
              ),

              // SingleChildScrollView(
              //   physics: const AlwaysScrollableScrollPhysics(),
              //   child: Column(
              //     children: numbers
              //         .map(
              //           (e) => Feed(
              //             postNumber: e,
              //           ),
              //         )
              //         .toList(),
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
