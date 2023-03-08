import 'package:flutter/material.dart';
import 'package:with_wall/const/colors.dart';
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
        CalendarScreen(),
        ProfileScreen(),
      ][tab],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: PRIMARY_COLOR,
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'place',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
