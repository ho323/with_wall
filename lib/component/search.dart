import 'package:flutter/material.dart';
import 'package:with_wall/const/colors.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        height: 50,
        decoration: BoxDecoration(
          color: PRIMARY_COLOR,
        ),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "검색",
                  icon: Icon(Icons.search),
                ),
                onChanged: (text){},
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => SearchDetail())
                  );
                },
              ),
            ),
          ],
        )
    );
  }
}

class SearchDetail extends StatefulWidget {
  const SearchDetail({Key? key}) : super(key: key);

  @override
  State<SearchDetail> createState() => _SearchPopUpState();
}

class _SearchPopUpState extends State<SearchDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Text("hello?\n"*10),
    );
  }
}
