
import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/circle_image.dart';

class HeaderMain extends StatefulWidget {
  @override
  _HeaderMainState createState() => _HeaderMainState();
}

class _HeaderMainState extends State<HeaderMain> {
  String dropdownValue = "Explore";

  @override
  Widget build(BuildContext context) {
    print("build header");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
          elevation: 0,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          dropdownColor: Colors.white,
          items: <String>["Explore", "Countries", "Cities", "Forum"]
              .map<DropdownMenuItem<String>>((value) {
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
    );
  }
}
