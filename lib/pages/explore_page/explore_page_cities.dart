import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/search_text_field.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/pages/explore_page/explore_page_cities_card.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MainCities extends StatefulWidget {
  @override
  _MainCitiesState createState() => _MainCitiesState();
}

class _MainCitiesState extends State<MainCities> {
  List cardInfo = [
    {
      "id": 1,
      "name": "Canngu, Bali",
      "country": "Indonesia",
      "temp": "31°",
      "star": 4.5,
      "wind": "19 Mps",
      "price": "\$1,150/month",
      "image": "assets/images/bali.jpg",
      "reviewer": 114,
      "description": "this is my example description only."
    },
    {
      "id": 2,
      "name": "BangKok",
      "country": "Thailand",
      "temp": "32°",
      "star": 4.9,
      "wind": "18 Mps",
      "price": "\$1,563/month",
      "image": "assets/images/bangkok.jpg",
      "reviewer": 123,
      "description": "this is my example description only."
    },
    {
      "id": 3,
      "name": "Berlin",
      "country": "Germany",
      "temp": "18°",
      "star": 4.3,
      "wind": "26 Mps",
      "price": "\$3,026/month",
      "image": "assets/images/berlin.jpg",
      "reviewer": 136,
      "description": "this is my example description only."
    },
    {
      "id": 4,
      "name": "Canngu, Bali 2",
      "country": "Indonesia",
      "temp": "31°",
      "star": 4.5,
      "wind": "19 Mps",
      "price": "\$1,150/month",
      "image": "assets/images/bali.jpg",
      "reviewer": 114,
      "description": "this is my example description only."
    },
    {
      "id": 5,
      "name": "BangKok 2",
      "country": "Thailand",
      "temp": "32°",
      "star": 4.9,
      "wind": "18 Mps",
      "price": "\$1,563/month",
      "image": "assets/images/bangkok.jpg",
      "reviewer": 140,
      "description": "this is my example description only."
    },
    {
      "id": 6,
      "name": "Berlin 2",
      "country": "Germany",
      "temp": "18°",
      "star": 4.3,
      "wind": "26 Mps",
      "price": "\$3,026/month",
      "image": "assets/images/berlin.jpg",
      "reviewer": 210,
      "description": "this is my example description only."
    },
  ];

  String dropdownValue = "Nomad score";

  @override
  Widget build(BuildContext context) {
    Widget _flightShuttleBuilder(
      BuildContext flightContext,
      Animation<double> animation,
      HeroFlightDirection flightDirection,
      BuildContext fromHeroContext,
      BuildContext toHeroContext,
    ) {
      return DefaultTextStyle(
        style: DefaultTextStyle.of(toHeroContext).style,
        child: toHeroContext.widget,
      );
    }

    return Expanded(
      child: Column(
        children: [
          SearchTextField(),
          SizedBox(height: 20),

          /// score and filter
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                width: MediaQuery.of(context).size.width * 0.4,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    elevation: 0,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    underline: Container(color: Colors.transparent),
                    dropdownColor: Colors.white,
                    items: <String>[
                      "Nomad score",
                      "Fan score",
                      "wiki score",
                      "predict score"
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
                ),
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.filter_list,
                        size: 20,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Filters",
                        style: normalStyle.copyWith(color: Colors.grey),
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(height: 20),

          /// Card
          Expanded(
            child: ListView.builder(
              itemCount: cardInfo.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MainCityCard(
                          id: cardInfo[index]['id'],
                          image: cardInfo[index]['image'],
                          name: cardInfo[index]['name'],
                          description: cardInfo[index]['description'],
                          price: cardInfo[index]['price'],
                          star: cardInfo[index]['star'],
                          wind: cardInfo[index]['wind'],
                          temp: cardInfo[index]['temp'],
                          reviewer: cardInfo[index]['reviewer'],
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: cardInfo[index]['id'],
                    flightShuttleBuilder: _flightShuttleBuilder,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(cardInfo[index]['image']),
                                fit: BoxFit.cover)),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.wb_sunny, size: 17),
                                          SizedBox(width: 5),
                                          Text(cardInfo[index]['temp'])
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SmoothStarRating(
                                            allowHalfRating: true,
                                            starCount: 5,
                                            rating: cardInfo[index]['star'],
                                            size: 20,
                                            color: AppColor.yellow,
                                          ),
                                          SizedBox(width: 5),
                                          Text(cardInfo[index]['star']
                                              .toString())
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40),
                                  Text(cardInfo[index]['name'],
                                      style: subHeaderStyle.copyWith(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 30),
                                  Text(cardInfo[index]['country'],
                                      style: titleStyle),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.autorenew, size: 17),
                                          SizedBox(width: 5),
                                          Text(cardInfo[index]['wind'])
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(cardInfo[index]['price']
                                              .toString())
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
