import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/search_text_field.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/model/favorite_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FavoriteExplorePage extends StatelessWidget {
  final List<Favorite> list = [
    Favorite(
      id: 1,
      name: "Seoul",
      image: "assets/images/bali.jpg",
      rating: 4.7,
      reviewers: 1468,
      isFavorite: true,
    ),
    Favorite(
      id: 2,
      name: "New York",
      image: "assets/images/bangkok.jpg",
      rating: 5.0,
      reviewers: 632,
      isFavorite: true,
    ),
    Favorite(
      id: 4,
      name: "London",
      image: "assets/images/berlin.jpg",
      rating: 4.1,
      reviewers: 549,
      isFavorite: true,
    ),
    Favorite(
      id: 3,
      name: "Seoul",
      image: "assets/images/bali.jpg",
      rating: 4.7,
      reviewers: 1468,
      isFavorite: true,
    ),
    Favorite(
      id: 6,
      name: "New York",
      image: "assets/images/bangkok.jpg",
      rating: 5.0,
      reviewers: 632,
      isFavorite: true,
    ),
    Favorite(
      id: 5,
      name: "London",
      image: "assets/images/berlin.jpg",
      rating: 4.1,
      reviewers: 549,
      isFavorite: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          SearchTextField(),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (builder, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(list[index].image),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                list[index].name,
                                style: titleStyle,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SmoothStarRating(
                                    allowHalfRating: true,
                                    starCount: 5,
                                    rating: list[index].rating,
                                    size: 20,
                                    color: AppColor.yellow,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    list[index].rating.toString(),
                                    style:
                                        normalStyle.copyWith(color: Colors.grey),
                                  ),
                                  Text(
                                    "(${list[index].reviewers})",
                                    style:
                                        normalStyle.copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: null,
                            iconSize: 20,
                          ),
                        ],
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
