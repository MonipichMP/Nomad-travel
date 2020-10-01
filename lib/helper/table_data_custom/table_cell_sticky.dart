import 'package:flutter/material.dart';
import 'package:nomad_travel/helper/table_data_custom/sticky_custom.dart';

class TableCellCustom extends StatelessWidget {
  TableCellCustom.content(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.white,
    this.onTap,
    this.alignment = Alignment.center,
    this.offsetX = 0.0,
    this.offsetY = 0.0,
  })  : cellWidth = cellDimensions.contentCellWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.black38,
        _colorVerticalBorder = Colors.lightGreen,
        _textAlign = TextAlign.center,
        _padding = EdgeInsets.zero;

  TableCellCustom.topLegend(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.white,
    this.onTap,
    this.alignment = Alignment.center,
    this.offsetX = 0.0,
    this.offsetY = 0.0,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.black38,
        _colorVerticalBorder = Colors.black38,
        _textAlign = TextAlign.start,
        _padding = EdgeInsets.zero;

  TableCellCustom.legend(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = const Color(0xFF2bba1d),
    this.onTap,
    this.alignment = Alignment.center,
    this.offsetX = 0.0,
    this.offsetY = 0.0,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.white,
        _colorVerticalBorder = Colors.black38,
        _textAlign = TextAlign.start,
        _padding = EdgeInsets.zero;

  TableCellCustom.topStickyRow(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = const Color(0xFF2bba1d),
    this.onTap,
    this.alignment = Alignment.center,
    this.offsetX = 0.0,
    this.offsetY = 0.0,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.black38,
        _colorVerticalBorder = Colors.black38,
        _textAlign = TextAlign.center,
        _padding = EdgeInsets.zero;

  TableCellCustom.stickyRow(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = const Color(0xFF2bba1d),
    this.onTap,
    this.alignment = Alignment.center,
    this.offsetX = 0.0,
    this.offsetY = 0.0,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.white,
        _colorVerticalBorder = Colors.black38,
        _textAlign = TextAlign.center,
        _padding = EdgeInsets.zero;

  TableCellCustom.stickyColumn(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.white,
    this.onTap,
    this.alignment = Alignment.centerLeft,
    this.offsetX = 0.0,
    this.offsetY = 0.0,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.black38,
        _colorVerticalBorder = Colors.black38,
        _textAlign = TextAlign.center,
        _padding = EdgeInsets.zero;

  final CellDimensions cellDimensions;
  final String text;
  final Function onTap;
  final double cellWidth;
  final double cellHeight;
  final double offsetX;
  final double offsetY;
  final Color colorBg;
  final Color _colorHorizontalBorder;
  final Color _colorVerticalBorder;
  final TextAlign _textAlign;
  final EdgeInsets _padding;
  final TextStyle textStyle;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cellWidth,
        height: cellHeight,
        padding: _padding,
        margin: EdgeInsets.all(0.1),
        decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: _colorHorizontalBorder,
                width: 0.25,
              ),
              right: BorderSide(
                color: _colorHorizontalBorder,
                width: 0.25,
              ),
            ),
            color: colorBg),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: alignment,
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  text,
                  style: textStyle,
                  maxLines: 1,
                  textAlign: _textAlign,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1.1,
              color: _colorVerticalBorder,
            ),
          ],
        ),
      ),
    );
  }
}
