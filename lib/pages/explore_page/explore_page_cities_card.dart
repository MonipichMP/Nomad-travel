import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MainCityCard extends StatelessWidget {
  final String image;
  final String name;
  final String temp;
  final String wind;
  final String description;
  final String price;
  final int id;
  final int reviewer;
  final double star;

  const MainCityCard({
    Key key,
    @required this.image,
    @required this.name,
    @required this.temp,
    @required this.wind,
    @required this.description,
    @required this.price,
    @required this.id,
    @required this.reviewer,
    @required this.star,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(
                        Icons.file_upload,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Hero(
                  tag: id,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SmoothStarRating(
                                      allowHalfRating: true,
                                      starCount: 5,
                                      rating: star,
                                      size: 20,
                                      color: AppColor.yellow,
                                    ),
                                    SizedBox(width: 5),
                                    Text(star.toString()),
                                    Text("($reviewer)"),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Text(
                                  name,
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
                                        Text(temp)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(wind),
                                        SizedBox(width: 5),
                                        Icon(Icons.autorenew, size: 17),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Text(description),
                                SizedBox(height: 20),
                                Text(price.toString()),
                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
