import 'package:flutter/material.dart';
import 'package:with_wall/const/colors.dart';
import 'package:with_wall/screen/add_post_screen.dart';
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
      floatingActionButton: renderFloatingActionButton(),
      body: [
        FeedScreen(),
        CenterListScreen(),
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
        items: const [
          BottomNavigationBarItem(
            backgroundColor: PRIMARY_COLOR,
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: PRIMARY_COLOR,
            icon: Icon(
              Icons.place,
            ),
            label: 'Place',
          ),
          BottomNavigationBarItem(
            backgroundColor: PRIMARY_COLOR,
            icon: Icon(
              Icons.calendar_month,
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            backgroundColor: PRIMARY_COLOR,
            icon: Icon(
              Icons.person_2,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget renderFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => AddPostScreen())
        );
      },
      backgroundColor: PRIMARY_COLOR,
      child: Icon(Icons.add),
    );
  }
}
