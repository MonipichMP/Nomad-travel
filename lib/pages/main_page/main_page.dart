import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/pages/explore_page/explore_page.dart';
import 'package:nomad_travel/pages/flight_page/flight_page.dart';
import 'package:nomad_travel/pages/job_page/job_page.dart';
import 'package:nomad_travel/pages/map_page/map_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  final menuScreens = [
    ExplorePage(),
    MapPage(),
    FlightPage(),
    JobPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menuScreens.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: index == 0
                ? Text(
                    "Explore\n•",
                    style: captionStyle.copyWith(
                      color: AppColor.orange,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Text(""),
            icon: index == 0
                ? Container(height: 0.0)
                : Icon(
                    Icons.explore,
                    color: Colors.grey,
                  ),
          ),
          BottomNavigationBarItem(
            title: index == 1
                ? Text(
                    "Map\n•",
                    style: captionStyle.copyWith(color: AppColor.orange),
                    textAlign: TextAlign.center,
                  )
                : Text(""),
            icon: index == 1
                ? Container(height: 0.0)
                : Icon(
                    Icons.map,
                    color: Colors.grey,
                  ),
          ),
          BottomNavigationBarItem(
            title: index == 2
                ? Text(
                    "Flight\n•",
                    style: captionStyle.copyWith(color: AppColor.orange),
                    textAlign: TextAlign.center,
                  )
                : Text(""),
            icon: index == 2
                ? Container(height: 0.0)
                : Icon(
                    Icons.flight_takeoff,
                    color: Colors.grey,
                  ),
          ),
          BottomNavigationBarItem(
            title: index == 3
                ? Text(
                    "Jobs\n•",
                    style: captionStyle.copyWith(color: AppColor.orange),
                    textAlign: TextAlign.center,
                  )
                : Text(""),
            icon: index == 3
                ? Container(height: 0.0)
                : Icon(
                    Icons.work,
                    color: Colors.grey,
                  ),
          ),
        ],
      ),
    );
  }
}
