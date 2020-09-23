import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/style.dart';

class DefaultButton extends StatelessWidget {
  final double height;
  final Function onPressed;
  final String title;

  const DefaultButton(
      {Key key, this.height, this.title, this.onPressed})
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
          color: Theme.of(context).buttonColor,
          onPressed: onPressed,
          child: Text(
            title,
            style: titleStyle.copyWith(color: Theme.of(context).accentColor),
          ),
        ),
      ),
    );
  }
}
