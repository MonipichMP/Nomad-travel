import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nomad_travel/helper/table_data_custom/data_table_top_sticky_custom.dart';
import 'package:nomad_travel/helper/table_data_custom/sticky_custom.dart';
import 'package:nomad_travel/helper/table_data_custom/table_cell_sticky.dart';

class HozChartOriginal extends StatefulWidget {
  @override
  _HozChartOriginalState createState() => _HozChartOriginalState();
}

class _HozChartOriginalState extends State<HozChartOriginal> {
  final columns = 10;
  final topColumns = 5;
  final secondTopColumns = 10;
  final rows = 20;
  final List<List<int>> output = [];

  List<List<int>> _makeData() {
    Random random = new Random();
    final List<int> col = [];
    for (int i = 0; i < columns; i++) {
      final List<int> row = [];

      for (int j = 0; j < rows; j++) {
        // row.add(i);
        // if (i == 0 && j < rows) {
          row.add(random.nextInt(5000));
        // }
        // row.add(random.nextInt(1));
      }
      output.add(row);
    }
    return output;
  }

  List<String> _makeTitleColumn() => List.generate(columns, (i) {
        switch (i % 4) {
          case 0:
            {
              int data = 0;
              for (int j = 0; j < rows - 1; j++) {
                data += output[j][0];
                print(data);
              }
              return "$data";
            }
          case 1:
            {
              int data = 0;
              for (int j = 1; j < rows - 1; j++) {
                data += output[j][0];
                print(data);
              }
              return "$data";
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

  List<String> _makeTopTitleColumn() => List.generate(secondTopColumns, (i) {
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
    "កោះរះ",
    "ល្វាសរ",
    "ពាមពញ៉ាអុង",
    "ភូមិធំ",
    "ព្រែកក្មេង",
    "ព្រែករៃ",
    "ព្រែករ៉ែ",
    "ព្រែកឬស្សី",
    "ព្រែកទំំពំាង",
    "ភូមិល្មម",
    "កោះរះ",
    "ល្វាសរ",
    "ពាមពញ៉ាអុង",
    "ភូមិធំ",
    "ព្រែកក្មេង",
    "ព្រែករៃ",
    "ព្រែករ៉ែ",
    "ព្រែកឬស្សី",
    "ព្រែកទំំពំាង",
    "ភូមិល្មម",
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
          child: DataTableTopStickyCustom(
            cellDimensions: const CellDimensions(
                contentCellWidth: 100,
                contentCellHeight: 50,
                stickyLegendWidth: 100,
                stickyLegendHeight: 50),
            cellFit: BoxFit.cover,
            topColumnsLength: topColumns,
            secondTopColumnsLength: secondTopColumns,
            columnsLength: columns,
            rowsLength: rows,
            topColumnsTitleBuilder: (i) => TableCellCustom.topStickyRow(
              _makeTopTitleColumn()[i],
              textStyle: TextStyle(fontSize: 12, color: Colors.white),
            ),
            secondTopColumnsTitleBuilder: (i) => TableCellCustom.topStickyRow(
              _makeTopTitleColumn()[i],
              textStyle: TextStyle(fontSize: 12, color: Colors.white),
            ),
            columnsTitleBuilder: (i) => TableCellCustom.stickyRow(
              _makeTitleColumn()[i],
              textStyle: TextStyle(fontSize: 12),
              colorBg: Colors.green[300],
            ),
            rowsTitleBuilder: (i) => Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TableCellCustom.stickyColumn(
                _makeTitleRow[i],
                textStyle: const TextStyle(fontSize: 14),
                colorBg: i % 2 == 0 ? Colors.white : Colors.grey[300],
              ),
            ),
            contentsTitleBuilder: (i, j) => TableCellCustom.content(
              _makeData()[i][j].toString(),
              textStyle: TextStyle(fontSize: 10),
              colorBg: j % 2 == 0 ? Colors.white : Colors.grey[300],
            ),
            topLegendCell: TableCellCustom.legend(
              "ឃំុ",
              textStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            legendCell: TableCellCustom.legend(
              "សរុប",
              textStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
