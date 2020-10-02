import 'package:flutter/material.dart';
import 'package:nomad_travel/helper/table_data_custom/sticky_custom.dart';

class DataTableTopStickyCustom extends StatefulWidget {
  final int topColumnsLength;
  final int secondTopColumnsLength;
  final int columnsLength;
  final int rowsLength;
  final BoxFit cellFit;
  final Widget legendCell;
  final Widget topLegendCell;
  final Widget secondLegendCell;
  final Widget secondTopLegendCell;
  final CellDimensions cellDimensions;
  final Widget Function(int colulmnIndex) topColumnsTitleBuilder;
  final Widget Function(int colulmnIndex) secondTopColumnsTitleBuilder;
  final Widget Function(int colulmnIndex) columnsTitleBuilder;
  final Widget Function(int colulmnIndex) rowsTitleBuilder;
  final Widget Function(int colulmnIndex) secondRowsTitleBuilder;
  final Widget Function(int colulmnIndex, int rowIndex) contentsTitleBuilder;

  const DataTableTopStickyCustom({
    Key key,
    @required this.topColumnsLength,
    @required this.secondTopColumnsLength,
    @required this.columnsLength,
    @required this.rowsLength,
    @required this.legendCell,
    @required this.topLegendCell,
    @required this.secondLegendCell,
    @required this.secondTopLegendCell,
    @required this.topColumnsTitleBuilder,
    @required this.secondTopColumnsTitleBuilder,
    @required this.columnsTitleBuilder,
    @required this.rowsTitleBuilder,
    @required this.secondRowsTitleBuilder,
    @required this.contentsTitleBuilder,
    @required this.cellDimensions,
    this.cellFit = BoxFit.scaleDown,
  }) : super(key: key);

  @override
  _DataTableTopStickyCustomState createState() =>
      _DataTableTopStickyCustomState();
}

class _DataTableTopStickyCustomState extends State<DataTableTopStickyCustom> {
  final ScrollController _verticalTitleController = ScrollController();
  final ScrollController _verticalBodyController = ScrollController();

  final ScrollController _horizontalBodyController = ScrollController();
  final ScrollController _horizontalTitleController = ScrollController();

  SyncScrollController _verticalSyncController;
  SyncScrollController _horizontalSyncController;

  @override
  void initState() {
    super.initState();
    _verticalSyncController = SyncScrollController(
        [_verticalTitleController, _verticalBodyController]);
    _horizontalSyncController = SyncScrollController(
        [_horizontalTitleController, _horizontalBodyController]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: widget.cellDimensions.contentCellHeight * 3),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// STICKY COLUMN
                  NotificationListener<ScrollNotification>(
                    child: SingleChildScrollView(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              widget.rowsLength,
                                  (i) => Container(
                                width: widget.cellDimensions.stickyLegendWidth,
                                height: widget.cellDimensions.contentCellHeight,
                                child: FittedBox(
                                  fit: widget.cellFit,
                                  child: widget.rowsTitleBuilder(i),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              widget.rowsLength,
                                  (i) => Container(
                                width: widget.cellDimensions.stickyLegendWidth,
                                height: widget.cellDimensions.contentCellHeight,
                                child: FittedBox(
                                  fit: widget.cellFit,
                                  child: widget.secondRowsTitleBuilder(i),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      controller: _verticalTitleController,
                    ),
                    onNotification: (ScrollNotification notification) {
                      _verticalSyncController.processNotification(
                          notification, _verticalTitleController);
                      return true;
                    },
                  ),

                  /// CONTENT
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification notification) {
                        _horizontalSyncController.processNotification(
                            notification, _horizontalBodyController);
                        return true;
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _horizontalBodyController,
                        child: NotificationListener<ScrollNotification>(
                          child: SingleChildScrollView(
                              controller: _verticalBodyController,
                              child: Column(
                                children: List.generate(
                                  widget.rowsLength,
                                  (int i) => Row(
                                    children: List.generate(
                                      widget.columnsLength,
                                      (int j) => Container(
                                        width: widget
                                            .cellDimensions.contentCellWidth,
                                        height: widget
                                            .cellDimensions.contentCellHeight,
                                        child: FittedBox(
                                          fit: widget.cellFit,
                                          child:
                                              widget.contentsTitleBuilder(j, i),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          onNotification: (ScrollNotification notification) {
                            _verticalSyncController.processNotification(
                                notification, _verticalBodyController);
                            return true;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        ///shadow
        Container(
          height: widget.cellDimensions.stickyLegendHeight * 3,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.7),
                blurRadius: 10.0,
                spreadRadius: 4.0,
                offset: Offset(0, 1))
          ]),
          child: Row(
            children: <Widget>[
              /// STICKY LEGEND
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: widget.cellDimensions.stickyLegendWidth,
                        height: widget.cellDimensions.stickyLegendHeight * 2,
                        child: FittedBox(
                          fit: widget.cellFit,
                          child: widget.topLegendCell,
                        ),
                      ),
                      Container(
                        width: widget.cellDimensions.stickyLegendWidth,
                        height: widget.cellDimensions.stickyLegendHeight,
                        child: FittedBox(
                          fit: widget.cellFit,
                          child: widget.legendCell,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: widget.cellDimensions.stickyLegendWidth,
                        height: widget.cellDimensions.stickyLegendHeight * 2,
                        child: FittedBox(
                          fit: widget.cellFit,
                          child: widget.secondTopLegendCell,
                        ),
                      ),
                      Container(
                        width: widget.cellDimensions.stickyLegendWidth,
                        height: widget.cellDimensions.stickyLegendHeight,
                        child: FittedBox(
                          fit: widget.cellFit,
                          child: widget.secondLegendCell,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              /// STICKY ROW
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification notification) {
                    _horizontalSyncController.processNotification(
                        notification, _horizontalTitleController);
                    return true;
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _horizontalTitleController,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            widget.topColumnsLength,
                            (i) => Container(
                              width: widget.cellDimensions.contentCellWidth * 2,
                              height: widget.cellDimensions.stickyLegendHeight,
                              child: FittedBox(
                                fit: widget.cellFit,
                                child: widget.topColumnsTitleBuilder(i),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            widget.secondTopColumnsLength,
                            (i) => Container(
                              width: widget.cellDimensions.contentCellWidth,
                              height: widget.cellDimensions.stickyLegendHeight,
                              child: FittedBox(
                                fit: widget.cellFit,
                                child: widget.secondTopColumnsTitleBuilder(i),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            widget.columnsLength,
                            (i) => Container(
                              width: widget.cellDimensions.contentCellWidth,
                              height: widget.cellDimensions.stickyLegendHeight,
                              child: FittedBox(
                                fit: widget.cellFit,
                                child: widget.columnsTitleBuilder(i),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
