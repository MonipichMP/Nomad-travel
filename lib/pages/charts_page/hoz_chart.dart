import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nomad_travel/common_widgets/table_data/cell_dimension.dart';
import 'package:nomad_travel/common_widgets/table_data/sticky_custom.dart';
import 'package:nomad_travel/common_widgets/table_data/table_cell_sticky.dart';

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
        switch (i % 4) {
          case 0:
            {
              return "អនុវត្ត​";
            }
          case 1:
            {
              return "អនុ ០៤/ ច្ប.០៤​";
            }
          case 2:
            {
              return "%ផសស (ច្ប)​​";
            }
          case 3:
            {
              return "%ផសស (អនុ)​";
            }
        }
        return '';
      });

  List<String> _makeTopTitleColumn() => List.generate(topColumns, (i) {
        switch (i % 5) {
          case 0:
            {
              return "ឆ្នាំ ២០០០​";
            }
          case 1:
            {
              return "ឆ្នាំ ២០០៥​";
            }
          case 2:
            {
              return "ឆ្នាំ ២០១០​";
            }
          case 3:
            {
              return "ឆ្នាំ ២០១៥​";
            }
          case 4:
            {
              return "ឆ្នាំ ២០២០​";
            }
        }
        return '';
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
          child: StickyHeadersTableCustom(
            cellDimensions: const CellDimensions(
                contentCellWidth: 200,
                contentCellHeight: 50,
                stickyLegendWidth: 200,
                stickyLegendHeight: 50),
            cellFit: BoxFit.cover,
            columnsLength: columns,
            topColumnsLength: topColumns,
            rowsLength: rows,
            topColumnsTitleBuilder: (i) => TableCellCustom.topStickyRow(
              _makeTopTitleColumn()[i],
              textStyle: TextStyle(fontSize: 6),
              colorBg: Colors.white,
            ),
            columnsTitleBuilder: (i) => TableCellCustom.stickyRow(
              _makeTitleColumn()[i],
              textStyle: TextStyle(color: Colors.white, fontSize: 14),
            ),
            rowsTitleBuilder: (i) => TableCellCustom.stickyColumn(
              _makeTitleRow[i],
              textStyle: TextStyle(fontSize: 12),
              colorBg: i % 2 == 0 ? Colors.white : Colors.grey[300],
            ),
            contentCellBuilder: (i, j) => TableCellCustom.content(
              _makeData()[i][j],
              textStyle: TextStyle(fontSize: 10),
              colorBg: j % 2 == 0 ? Colors.white : Colors.grey[300],
            ),
            topLegendCell: TableCellCustom.topLegend(
              "ចំណូលថវិកា",
              textStyle: TextStyle(fontSize: 20),
            ),
            legendCell: TableCellCustom.legend(
              "បរិយាយ",
              textStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
