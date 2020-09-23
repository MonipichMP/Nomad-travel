import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineTileCustom extends StatelessWidget {
  final String assetHotel;
  final String nameHotel;
  final String status;
  final double rating;
  final String time;
  final int index;
  final int length;

  TimelineTileCustom({
    this.assetHotel,
    this.nameHotel,
    this.status,
    this.rating,
    this.time,
    this.index,
    this.length,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineX: 0.27,
      topLineStyle: LineStyle(color: Colors.grey, width: 2),
      indicatorStyle: IndicatorStyle(
        width: 40,
        height: 40,
        indicatorY: 0.5,
        indicator: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.grey,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Icon(
                    Icons.flight_land,
                    size: 20,
                    color: AppColor.orange,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      isFirst: index == 0 ? true : false,
      isLast: index == length - 1 ? true : false,
      rightChild: buildCardRightChild(assetHotel, rating, nameHotel, status),
      leftChild: buildLeftChild(time),
    );
  }
}

Widget buildLeftChild(String time) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      time,
      style: normalStyle,
    ),
  );
}

Widget buildCardRightChild(
  String assetName,
  double rating,
  String nameHotel,
  String status,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColor.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(assetName),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmoothStarRating(
                size: 15,
                rating: rating,
                color: AppColor.orange,
              ),
              Text(nameHotel, style: normalStyle.copyWith(color: Colors.black)),
              Text(status, style: captionStyle.copyWith(color: Colors.grey)),
            ],
          )
        ],
      ),
    ),
  );
}
