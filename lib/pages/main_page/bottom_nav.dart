import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    print("build bottom nav");
    return BottomNavigationBar(
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
          icon: index == 0 ? Container(height: 0.0) : Icon(Icons.explore),
        ),
        BottomNavigationBarItem(
          title: index == 1
              ? Text(
                  "Map\n•",
                  style: captionStyle.copyWith(color: AppColor.orange),
                  textAlign: TextAlign.center,
                )
              : Text(""),
          icon: index == 1 ? Container(height: 0.0) : Icon(Icons.map),
        ),
        BottomNavigationBarItem(
          title: index == 2
              ? Text(
                  "Flight\n•",
                  style: captionStyle.copyWith(color: AppColor.orange),
                  textAlign: TextAlign.center,
                )
              : Text(""),
          icon:
              index == 2 ? Container(height: 0.0) : Icon(Icons.flight_takeoff),
        ),
        BottomNavigationBarItem(
          title: index == 3
              ? Text(
                  "Jobs\n•",
                  style: captionStyle.copyWith(color: AppColor.orange),
                  textAlign: TextAlign.center,
                )
              : Text(""),
          icon: index == 3 ? Container(height: 0.0) : Icon(Icons.work),
        ),
      ],
    );
  }
}
