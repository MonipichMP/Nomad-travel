import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nomad_travel/constants/colors.dart';

class OrangeBackpack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColor.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          "assets/images/backpack.svg",
          color: Colors.white70,
        ),
      ),
    );
  }
}
