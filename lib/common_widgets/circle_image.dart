import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double height;
  final double width;
  final ImageProvider image;

  const CircleImage({Key key, this.height, this.width, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: image,
        ),
      ),
    );
  }
}
