import 'package:flutter/material.dart';
import 'package:with_wall/const/colors.dart';
import 'package:with_wall/screen/add_post.dart';
import 'package:with_wall/screen/caledar_screen.dart';
import 'package:with_wall/screen/center_list_screen.dart';
import 'package:with_wall/screen/feed_screen.dart';
import 'package:with_wall/screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        FeedScreen(),
        CenterListScreen(),
        AddPostScreen(),
        CalendarScreen(),
        ProfileScreen(),
      ][tab],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
        currentIndex: tab,
        items: [
          BottomNavigationBarItem(
            backgroundColor: PRIMARY_COLOR,
            icon: Icon(
              Icons.home,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            backgroundColor: PRIMARY_COLOR,
            icon: Icon(
              Icons.place,
            ),
            label: 'place',
          ),
          BottomNavigationBarItem(
            backgroundColor: PRIMARY_COLOR,
            icon: Icon(
              Icons.add_circle_outline,
            ),
            label: 'add',
          ),
          BottomNavigationBarItem(
            backgroundColor: PRIMARY_COLOR,
            icon: Icon(
              Icons.calendar_month,
            ),
            label: 'calendar',
          ),
          BottomNavigationBarItem(
            backgroundColor: PRIMARY_COLOR,
            icon: Icon(
              Icons.person_2,
            ),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
