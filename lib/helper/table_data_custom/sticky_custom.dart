import 'package:flutter/material.dart';

/// This was copied from library name: Sticky Header Table
/// But I customized them to fit with requirements

/// Table with sticky headers. Whenever you scroll content horizontally
/// or vertically - top and left headers always stay.
class StickyHeadersTableCustom extends StatefulWidget {
  StickyHeadersTableCustom({
    Key key,

    /// Number of top Columns above columns wrap it into categories (for content only)
    @required this.topColumnsLength,

    /// Number of Columns (for content only)
    @required this.columnsLength,

    /// Number of Rows (for content only)
    @required this.rowsLength,

    /// Builder for top column titles. Takes index of content top column as parameter
    /// and returns String for top column title
    this.topColumnsTitleBuilder,

    /// Builder for column titles. Takes index of content column as parameter
    /// and returns String for column title
    @required this.columnsTitleBuilder,

    /// Builder for row titles. Takes index of content row as parameter
    /// and returns String for row title
    @required this.rowsTitleBuilder,

    /// Builder for content cell. Takes index for content column first,
    /// index for content row second and returns String for cell
    @required this.contentCellBuilder,

    /// Top Title for Top Left cell (always visible)
    this.topLegendCell = const Text(' '),

    /// Title for Left cell (always visible)
    this.legendCell = const Text(' '),

    /// Table cell dimensions
    this.cellDimensions = CellDimensions.base,

    /// Type of fit for content
    this.cellFit = BoxFit.scaleDown,

  }) : super(key: key) {
    assert(columnsLength != null);
    assert(rowsLength != null);
    assert(columnsTitleBuilder != null);
    assert(rowsTitleBuilder != null);
    assert(contentCellBuilder != null);
  }

  final int rowsLength;
  final int columnsLength;
  final int topColumnsLength;
  final Widget legendCell;
  final Widget topLegendCell;
  final Widget Function(int colulmnIndex) columnsTitleBuilder;
  final Widget Function(int colulmnIndex) topColumnsTitleBuilder;
  final Widget Function(int rowIndex) rowsTitleBuilder;
  final Widget Function(int columnIndex, int rowIndex) contentCellBuilder;
  final CellDimensions cellDimensions;
  final BoxFit cellFit;

  @override
  _StickyHeadersTableCustomState createState() =>
      _StickyHeadersTableCustomState();
}

class _StickyHeadersTableCustomState extends State<StickyHeadersTableCustom> {
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
            SizedBox(height: widget.cellDimensions.contentCellHeight * 2),
            Expanded(
              child: Stack(
                children: [
                  /// CONTENT
                  Row(
                    children: [
                      SizedBox(width: widget.cellDimensions.contentCellWidth),
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
                                            width: widget.cellDimensions
                                                .contentCellWidth,
                                            height: widget.cellDimensions
                                                .contentCellHeight,
                                            child: FittedBox(
                                              fit: widget.cellFit,
                                              child: widget.contentCellBuilder(
                                                  j, i),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              onNotification:
                                  (ScrollNotification notification) {
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

                  /// STICKY COLUMN
                  Container(
                    width: widget.cellDimensions.stickyLegendWidth,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          blurRadius: 10.0,
                          spreadRadius: 4.0,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: NotificationListener<ScrollNotification>(
                      child: SingleChildScrollView(
                        child: Column(
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
                        controller: _verticalTitleController,
                      ),
                      onNotification: (ScrollNotification notification) {
                        _verticalSyncController.processNotification(
                            notification, _verticalTitleController);
                        return true;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: widget.cellDimensions.stickyLegendHeight * 2,
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
              Column(
                children: [
                  Container(
                    width: widget.cellDimensions.stickyLegendWidth,
                    height: widget.cellDimensions.stickyLegendHeight,
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
                              width: widget.cellDimensions.contentCellWidth * 4,
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
    contentCellWidth: 70.0,
    contentCellHeight: 50.0,
    stickyLegendWidth: 120.0,
    stickyLegendHeight: 50.0,
  );
}

/// SyncScrollController keeps scroll controllers in sync.
class SyncScrollController {
  SyncScrollController(List<ScrollController> controllers) {
    controllers
        .forEach((controller) => _registeredScrollControllers.add(controller));
  }

  final List<ScrollController> _registeredScrollControllers = [];

  ScrollController _scrollingController;
  bool _scrollingActive = false;

  processNotification(
      ScrollNotification notification, ScrollController sender) {
    if (notification is ScrollStartNotification && !_scrollingActive) {
      _scrollingController = sender;
      _scrollingActive = true;
      return;
    }

    if (identical(sender, _scrollingController) && _scrollingActive) {
      if (notification is ScrollEndNotification) {
        _scrollingController = null;
        _scrollingActive = false;
        return;
      }

      if (notification is ScrollUpdateNotification) {
        for (ScrollController controller in _registeredScrollControllers) {
          if (identical(_scrollingController, controller)) continue;
          controller.jumpTo(_scrollingController.offset);
        }
      }
    }
  }
}
