import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/default_button.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FlightCardBook extends StatefulWidget {
  final String image;
  final String title;
  final String placeFrom;
  final String placeTo;
  final double star;
  final double distance;
  final String price;
  final int reviewer;

  const FlightCardBook({
    Key key,
    @required this.image,
    @required this.title,
    @required this.placeFrom,
    @required this.placeTo,
    @required this.star,
    @required this.distance,
    @required this.price,
    @required this.reviewer,
  }) : super(key: key);

  @override
  _FlightCardBookState createState() => _FlightCardBookState();
}

class _FlightCardBookState extends State<FlightCardBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            widget.image,
            fit: BoxFit.cover,
            height: 400,
            width: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            Icons.file_upload,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 250),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(3)),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            widget.title,
                            style: titleStyle.copyWith(color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SmoothStarRating(
                                allowHalfRating: true,
                                starCount: 5,
                                rating: widget.star,
                                size: 20,
                                color: AppColor.yellow,
                              ),
                              SizedBox(width: 5),
                              Text(
                                widget.star.toString(),
                                style: normalStyle.copyWith(color: Colors.grey),
                              ),
                              Text(
                                "(${widget.reviewer})",
                                style: normalStyle.copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(height: 14),
                          Container(
                            height: 2,
                            width: double.infinity,
                            color: Colors.grey[200],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "From",
                                    style: normalStyle.copyWith(
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    widget.placeFrom,
                                    style: titleStyle.copyWith(
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 14),
                                  Text(
                                    "Distance",
                                    style: normalStyle.copyWith(
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "${widget.distance} km",
                                    style: titleStyle.copyWith(
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(width: 100),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "To",
                                    style: normalStyle.copyWith(
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    widget.placeTo,
                                    style: titleStyle.copyWith(
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 14),
                                  Text(
                                    "Price",
                                    style: normalStyle.copyWith(
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    widget.price,
                                    style: titleStyle.copyWith(
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Stack(
                            children: [
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.3),
                                  BlendMode.srcOver,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 290,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/map_from_one_to_another.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 200),
                                  DefaultButton(
                                    height: 56,
                                    title: "Book Your Trip",
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
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
