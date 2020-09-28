import 'package:flutter/material.dart';

/// Dimensions for table
class CellDimensions {
  const CellDimensions({
    /// Content cell width. It also applied to sticky row width.
    @required this.contentCellWidth,

    /// Content cell height. It also applied to sticky column height.
    @required this.contentCellHeight,

    /// Sticky legend width. It also applied to sticky column width.
    @required this.stickyLegendWidth,

    /// Sticky legend height/ It also applied to sticky row height.
    @required this.stickyLegendHeight,
  });

  final double contentCellWidth;
  final double contentCellHeight;
  final double stickyLegendWidth;
  final double stickyLegendHeight;

  static const CellDimensions base = CellDimensions(
    contentCellWidth: 90.0,
    contentCellHeight: 50.0,
    stickyLegendWidth: 160.0,
    stickyLegendHeight: 50.0,
  );
}