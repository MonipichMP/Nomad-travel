import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/category_select.dart';
import 'package:nomad_travel/common_widgets/search_text_field.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/common_widgets/place_card.dart';

class MainExplore extends StatefulWidget {
  @override
  _MainExploreState createState() => _MainExploreState();
}

class _MainExploreState extends State<MainExplore> {

  int currentIndex = 0;
  List categoryTypes = [
    {
      "title": "New",
      "isSelected": true,
    },
    {
      "title": "Popular",
      "isSelected": false,
    },
    {
      "title": "Recent",
      "isSelected": false,
    },
    {
      "title": "Recommendation",
      "isSelected": false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(),
          SizedBox(height: 25),
          Row(
            children: List.generate(
              categoryTypes.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: CategorySelect(
                  index: index,
                  title: categoryTypes[index]['title'],
                  currentIndex: currentIndex,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                categoryTypes.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: PlaceCard(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Your current location",
            style: normalStyle.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView(
              physics: BouncingScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/images/map.jpeg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/images/sun.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("26 c", style: titleStyle),
                            SizedBox(height: 15),
                            Text("Greece", style: subtitleStyle),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/sunrise_in_greece.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/sunrise_in_greece.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
