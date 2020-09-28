import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/table_data/cell_dimension.dart';

class DataTableCustom extends StatefulWidget {
  final int columnsLength;
  final BoxFit cellFit;
  final CellDimensions cellDimensions;
  final Widget Function(int colulmnIndex) columnsTitleBuilder;
  final Widget Function(int colulmnIndex) contentsTitleBuilder;

  const DataTableCustom({
    Key key,
    @required this.columnsLength,
    @required this.columnsTitleBuilder,
    @required this.contentsTitleBuilder,
    @required this.cellDimensions,
    this.cellFit = BoxFit.scaleDown,
  }) : super(key: key);

  @override
  _DataTableCustomState createState() => _DataTableCustomState();
}

class _DataTableCustomState extends State<DataTableCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(
            widget.columnsLength,
            (i) => Container(
              width: widget.cellDimensions.contentCellWidth,
              height: widget.cellDimensions.contentCellHeight,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black38,
                  width: 0.25,
                ),
                color: Colors.green,
              ),
              child: FittedBox(
                fit: widget.cellFit,
                child: widget.columnsTitleBuilder(i),
              ),
            ),
          ),
        ),
        Row(
          children: List.generate(
            widget.columnsLength,
            (i) => Container(
              width: widget.cellDimensions.contentCellWidth,
              height: widget.cellDimensions.contentCellHeight,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black38,
                  width: 0.25,
                ),
                color: Colors.white,
              ),
              child: FittedBox(
                fit: widget.cellFit,
                child: widget.contentsTitleBuilder(i),
              ),
            ),
          ),
        )
      ],
    );
  }
}
