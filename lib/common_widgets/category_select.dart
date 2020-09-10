import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/style.dart';

class CategorySelect extends StatefulWidget {
  final String title;
  final int index;
  final int currentIndex;

  const CategorySelect({Key key, this.title, this.index, this.currentIndex})
      : super(key: key);

  @override
  _CategorySelectState createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
      decoration: BoxDecoration(
        color: widget.index == widget.currentIndex
            ? Colors.white
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        widget.title,
        style: normalStyle.copyWith(
            color: widget.index == widget.currentIndex
                ? Colors.black
                : Colors.grey),
      ),
    );
  }
}
