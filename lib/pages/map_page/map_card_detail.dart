import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MapCardDetail extends StatefulWidget {
  @override
  _MapCardDetailState createState() => _MapCardDetailState();
}

class _MapCardDetailState extends State<MapCardDetail> {
  List cardPlaces = [
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

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text("${currentIndex + 1}/${cardPlaces.length}",
                      style: titleStyle.copyWith(color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 5),
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  children: List.generate(
                    cardPlaces.length,
                    (index) {
                      return Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image:
                                        AssetImage(cardPlaces[index]['image']),
                                    fit: BoxFit.cover),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SmoothStarRating(
                                              allowHalfRating: true,
                                              starCount: 5,
                                              rating: cardPlaces[index]['star'],
                                              size: 20,
                                              color: AppColor.yellow,
                                            ),
                                            SizedBox(width: 5),
                                            Text(cardPlaces[index]['star']
                                                .toString()),
                                            Text(
                                                "(${cardPlaces[index]['reviewer']})"),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          cardPlaces[index]['name'],
                                          style: headerStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.wb_sunny, size: 17),
                                                SizedBox(width: 5),
                                                Text(cardPlaces[index]['temp'])
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(cardPlaces[index]['wind']),
                                                SizedBox(width: 5),
                                                Icon(Icons.autorenew, size: 17),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Text(cardPlaces[index]['description']),
                                        SizedBox(height: 20),
                                        Text(cardPlaces[index]['price']
                                            .toString()),
                                        SizedBox(height: 15),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}