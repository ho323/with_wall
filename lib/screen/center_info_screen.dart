import 'package:flutter/material.dart';
import 'package:with_wall/component/search.dart';
import 'package:with_wall/const/colors.dart';
import 'center_list_screen.dart';

class CenterInfoScreen extends StatefulWidget {
  final int centerNumber;

  const CenterInfoScreen({
    required this.centerNumber,
    Key? key,
  }) : super(key: key);

  @override
  State<CenterInfoScreen> createState() => _CenterInfoScreenState();
}

class _CenterInfoScreenState extends State<CenterInfoScreen> {
  var scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        print("scroll 끝까지 함");
      }
    });
  }

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
              child: ListView(
                children: [
                  CenterImg(),
                  Text("main_img_url 참고해서 넣기", style: TextStyle(fontSize: 25),),
                  CenterInfo(),
                  CenterRecommendPost(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CenterImg extends StatelessWidget {
  const CenterImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: PRIMARY_COLOR),
      ),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Image(
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://us.123rf.com/450wm/misteremil/misteremil1808/misteremil180800085/111523288-rock-climbing-icon-set-vector-icons-illustration.jpg?ver=6"),
        ),
      ),
    );
  }
}

class CenterInfo extends StatelessWidget {
  const CenterInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: PRIMARY_COLOR),
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("store_name"),
          Text("address"),
          Text("naver_map_url"),
          Text("level_list"),
          Text("open_time_list"),
          Text("price_list"),
        ],
      ),
    );
  }
}

class CenterRecommendPost extends StatelessWidget {
  CenterRecommendPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.blueGrey,
              child: Center(
                child: Text(
                  'Item $index',
                ),
              ),
            );
          }),
    );
  }
}
