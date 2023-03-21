import 'package:flutter/material.dart';
import 'package:with_wall/component/search.dart';
import 'package:with_wall/const/colors.dart';
import 'package:with_wall/component/center_info.dart';
import 'dart:convert';


class CenterListScreen extends StatefulWidget {
  CenterListScreen({Key? key}) : super(key: key);

  @override
  State<CenterListScreen> createState() => _CenterListScreenState();
}

class _CenterListScreenState extends State<CenterListScreen> {
  var PlaceInfo = SampleData();
  List<int> CenterIdxNumbers = [];
  List<int> TestIdxNumbers = List.generate(10, (index) => index);

  GetCenterList() async {
    setState(() {
      CenterIdxNumbers = List.generate(PlaceInfo.TestData.length, (index) => index);

      // List<int> CenterIdxNumbers = List.generate(PlaceInfo.TestData.length, (index) => index);
      // print("${PlaceInfo.TestData[0]['store_name']}");
      // print("${PlaceInfo.TestData.length}"); // store 개수
    });
    // var routeFromJsonFile = await rootBundle.loadString('asset/center_list_json/center_list_json.json');
  }

  @override
  void initState() {
    super.initState();
    GetCenterList();
  }

  @override
  Widget build(BuildContext context) {
    if (CenterIdxNumbers.isNotEmpty) {
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
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    children: TestIdxNumbers.map((e) => CenterInfo(centerNumber: e,),).toList(),
                  ),

                ),
              ),
            ],
          ),
        ),
      );
    }
    else {
      return CircularProgressIndicator();
    }
  }

  Widget renderCenter(e) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: PRIMARY_COLOR),
      ),
      child: Center(
        child: Text(e.toString()),
      ),
    );
  }
}

class SampleData {
  var TestData =
    [
      {
        "store_name": "서울숲클라이밍",
        "naver_category": "암벽등반",
        "address": "서울 성동구 성수일로 19 지하2층, 서울숲역 1번 / 뚝섬역 5번 출구 약 500m, 서울숲역 1번 / 뚝섬역 5번 출구 약 500m, 서울숲역 1번 / 뚝섬역 5번 출구",
        "naver_map_url": "https://map.naver.com/v5/search/%ED%81%B4%EB%9D%BC%EC%9D%B4%EB%B0%8D/place/1499380146?c=13,0,0,0,dh&placePath=%3Fentry%253Dbmp",
        "main_img_url": "https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;type=f184_184&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20201114_286%2F1605332312077szmzy_JPEG%2F2Oi362IF1cJFmuId0DrRUPnI.jpeg.jpg",
        "price_list": [
          "스타터반(강습+1개월이용+장비대여)=230000",
          "1일 체험(강습+이용+장비대여)=30000",
          "10회 이용(크루)=180000",
          "10회 이용(개인)=170000",
          "5회권=90000",
          "6개월 이용=540000",
          "3개월 이용=300000",
          "1개월 이용=130000",
          "일일 이용권=20000"
        ],
        "open_time_list": [
          "화=12:00 - 23:00",
          "수=12:00 - 23:00",
          "목=12:00 - 23:00",
          "금=12:00 - 23:00",
          "토=10:00 - 19:00",
          "일=10:00 - 19:00",
          "월=12:00 - 23:00"
        ],
        "level_list": ["빨","주","노","초","파","남"],
        "change_time_list": []
      },
      {
        "store_name": "훅클라이밍 성수점",
        "naver_category": "암벽등반",
        "address": "서울 성동구 성수일로12길 34 3층",
        "naver_map_url": "https://map.naver.com/v5/search/%ED%81%B4%EB%9D%BC%EC%9D%B4%EB%B0%8D/place/1442106588?c=13,0,0,0,dh&placePath=%3Fentry%253Dbmp",
        "main_img_url": "https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;type=f184_184&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210201_200%2F161215557159883zot_JPEG%2FWKLJl7tIJwQ9Lj1sulP4XVUi.jpeg.jpg",
        "price_list": [
          "일일 이용권=20000",
          "일일 체험권(예약 필수)=30000",
          "10회 이용권=170000",
          "1개월 이용권=130000",
          "3개월 이용권=300000",
          "6개월 이용권=550000",
          "12개월 이용권=1,050000",
          "3회권=50000",
          "5회권=80000"
        ],
        "open_time_list": [
          "화=12:00 - 23:00",
          "수=12:00 - 23:00",
          "목=12:00 - 23:00",
          "금=12:00 - 23:00",
          "토=12:00 - 20:00",
          "일=12:00 - 20:00",
          "월=12:00 - 23:00"
        ],
        "level_list": ["남","보","빨","주","노"],
        "change_time_list": []
      }
    ];
}

// json -> object
class Place {
  String? store_name;
  String? naver_category;
  String? address;
  String? naver_map_url;
  String? main_img_url;
  // List<String>? price_list;
  // List<String>? open_time_list;
  // List<String>? level_list;
  // List<String>? change_time_list;

  Place ({
  this.store_name,
  this.naver_category,
  this.address,
  this.naver_map_url,
  this.main_img_url,
  // this.price_list,
  // this.open_time_list,
  // this.level_list,
  // this.change_time_list,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
  store_name: json["store_name"],
  naver_category: json["naver_category"],
  address: json["address"],
  naver_map_url: json["naver_map_url"],
  main_img_url: json["main_img_url"],
  // price_list: json["price_list"],
  // open_time_list: json["open_time_list"],
  // level_list: json["level_list"],
  // change_time_list: json["change_time_list"],
  );
}

class PlaceList {
  final List<Place>? places;

  PlaceList({this.places});

  factory PlaceList.fromJson(String jsonString) {
    List<dynamic> listFromJson = json.decode(jsonString);
    List<Place> places = <Place>[];

    places = listFromJson.map((place) => Place.fromJson(place)).toList();
    return PlaceList(places: places);
  }
}