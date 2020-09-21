import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/pages/sign_up_page/sign_up_screen.dart';

class DefaultButton extends StatelessWidget {
  final double height;
  final Color color;
  final Function onPressed;
  final String title;

  const DefaultButton(
      {Key key, this.height, this.color, this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 38.0),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: color,
          onPressed: onPressed,
          child: Text(
            title,
            style: titleStyle,
          ),
        ),
      ),
    );
  }
}
