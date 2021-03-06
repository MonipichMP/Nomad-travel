import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/circle_image.dart';
import 'package:nomad_travel/pages/explore_page/explore_page_cities.dart';
import 'package:nomad_travel/pages/explore_page/explore_page_countries.dart';
import 'package:nomad_travel/pages/explore_page/explore_page_explore.dart';
import 'package:nomad_travel/pages/explore_page/explore_page_forum.dart';
import 'package:nomad_travel/pages/explore_page/favorite_explore_page.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String dropdownValue = "Explore";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.transparent,
                  ),
                  dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                  items: <String>[
                    "Explore",
                    "Countries",
                    "Cities",
                    "Forums",
                    "Favorites"
                  ].map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                ),
                Stack(
                  children: [
                    CircleImage(
                      height: 40,
                      width: 40,
                      image: NetworkImage(
                          "https://i.pinimg.com/564x/f4/1f/e3/f41fe384dd173f91201f622e11be8a31.jpg"),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 10,
                        width: 10,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            if (dropdownValue == "Explore") MainExplore(),
            if (dropdownValue == "Countries") MainCountries(),
            if (dropdownValue == "Cities") MainCities(),
            if (dropdownValue == "Forums") MainForums(),
            if (dropdownValue == "Favorites") FavoriteExplorePage(),
          ],
        ),
      ),
    );
  }
}
