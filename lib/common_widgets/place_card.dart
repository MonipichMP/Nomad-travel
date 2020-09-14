import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/style.dart';

class PlaceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Card(
        elevation: 10,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/sunrise_in_greece.jpg",
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                children: [
                  Text(
                    "Sunrise in Greece",
                    style: titleStyle.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "14.09.2019",
                    style: normalStyle.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
