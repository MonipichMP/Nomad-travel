import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nomad_travel/common_widgets/sticky_custom.dart';

class HozChart extends StatefulWidget {
  @override
  _HozChartState createState() => _HozChartState();
}

class _HozChartState extends State<HozChart> {
  final columns = 20;
  final topColumns = 5;
  final rows = 20;

  List<List<String>> _makeData() {
    final List<List<String>> output = [];
    for (int i = 0; i < columns; i++) {
      final List<String> row = [];
      for (int j = 0; j < rows; j++) {
        row.add('T$i : L$j');
      }
      output.add(row);
    }
    return output;
  }

  List<String> _makeTitleColumn() => List.generate(columns, (i) {
        return '${2000 + i}';
      });

  List<String> _makeTopTitleColumn() => List.generate(topColumns, (i) {
    return '${2000 + i}';
  });

  List<String> _makeTitleRow = [
    " - ថវិកាថ្នាក់ក្រោមជាតិ",
    "ថវិកាថ្នាក់ជាតិ",
    "ជាតិ",
    "ក្នុងនោះ ចំណូលក្នុងប្រទេសថវិការដ្ឋ​",
    " - ចំណូលជាតិ",
    " - ចំណូលក្នុងប្រទេស",
    "ថវិកា",
    "ក្នុងនោះ ចំណូលក្នុងប្រទេសថវិការដ្ឋ",
    "ចំណូលជាតិ",
    "ចំណូលក្នុងប្រទេស",
    "ថវិកាថ្នាក់ក្រោមជាតិ",
    "ថវិកាថ្នាក់ជាតិ",
    "ជាតិ",
    "ក្នុងនោះ ចំណូលក្នុងប្រទេសថវិការដ្ឋ​",
    "ចំណូលជាតិ",
    "ចំណូលក្នុងប្រទេស",
    "ថវិកា",
    "ក្នុងនោះ ចំណូលក្នុងប្រទេសថវិការដ្ឋ",
    "ចំណូលជាតិ",
    "ចំណូលក្នុងប្រទេស",
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: StickyHeadersTable(
            cellDimensions: const CellDimensions(
                contentCellWidth: 200,
                contentCellHeight: 50,
                stickyLegendWidth: 200,
                stickyLegendHeight: 50),
            cellFit: BoxFit.cover,
            columnsLength: columns,
            topColumnsLength: topColumns,
            rowsLength: rows,
            topColumnsTitleBuilder: (i) => TableCell.topStickyRow(
              _makeTopTitleColumn()[i],
              textStyle: TextStyle(color: Colors.white, fontSize: 20),
            ),
            columnsTitleBuilder: (i) => TableCell.stickyRow(
              _makeTitleColumn()[i],
              textStyle: TextStyle(color: Colors.white, fontSize: 20),
            ),
            rowsTitleBuilder: (i) => TableCell.stickyColumn(
              _makeTitleRow[i],
              textStyle: TextStyle(fontSize: 15),
              colorBg: i % 2 == 0 ? Colors.white : Colors.grey[300],
            ),
            contentCellBuilder: (i, j) => TableCell.content(
              _makeData()[i][j],
              colorBg: j % 2 == 0 ? Colors.white : Colors.grey[300],
            ),
            topLegendCell: TableCell.legend(
              "ចំណូលថវិកា",
              textStyle: TextStyle(fontSize: 24),
              colorBg: Colors.white,
            ),
            legendCell: TableCell.legend(
              "បរិយាយ",
              textStyle: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

class TableCell extends StatelessWidget {
  TableCell.content(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.white,
    this.onTap,
    this.alignment = Alignment.center,
    this.elevation = 0.0,
  })  : cellWidth = cellDimensions.contentCellWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.black38,
        _colorVerticalBorder = Colors.lightGreen,
        _textAlign = TextAlign.center,
        _padding = EdgeInsets.zero;

  TableCell.legend(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = const Color(0xFF2bba1d),
    this.onTap,
    this.alignment = Alignment.center,
    this.elevation = 0.0,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.white,
        _colorVerticalBorder = Colors.black38,
        _textAlign = TextAlign.start,
        _padding = EdgeInsets.zero;

  TableCell.topStickyRow(
      this.text, {
        this.textStyle,
        this.cellDimensions = const CellDimensions(
            contentCellWidth: 300,
            contentCellHeight: 100,
            stickyLegendWidth: 200,
            stickyLegendHeight: 100),
        this.colorBg = const Color(0xFF2bba1d),
        this.onTap,
        this.alignment = Alignment.center,
        this.elevation = 0.0,
      })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.white,
        _colorVerticalBorder = Colors.black38,
        _textAlign = TextAlign.center,
        _padding = EdgeInsets.zero;

  TableCell.stickyRow(
    this.text, {
    this.textStyle,
    this.cellDimensions = const CellDimensions(
        contentCellWidth: 300,
        contentCellHeight: 100,
        stickyLegendWidth: 200,
        stickyLegendHeight: 100),
    this.colorBg = const Color(0xFF2bba1d),
    this.onTap,
    this.alignment = Alignment.center,
    this.elevation = 0.0,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.white,
        _colorVerticalBorder = Colors.black38,
        _textAlign = TextAlign.center,
        _padding = EdgeInsets.zero;

  TableCell.stickyColumn(
    this.text, {
    this.textStyle,
    this.cellDimensions = const CellDimensions(
        contentCellWidth: 200,
        contentCellHeight: 100,
        stickyLegendWidth: 200,
        stickyLegendHeight: 100),
    this.colorBg = Colors.white,
    this.onTap,
    this.alignment = Alignment.centerLeft,
    this.elevation = 10.0,
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
  final double elevation;
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
        decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: _colorHorizontalBorder, width: 0.0),
              right: BorderSide(color: _colorHorizontalBorder, width: 0.5),
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
