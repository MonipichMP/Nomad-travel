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
  final columns = 8;
  final topColumns = 4;
  final secondTopColumns = 8;
  final rows = 20;
  final List<List<num>> output = [];
  int total = 0;

  List<List<num>> _makeData() {
    Random random = new Random();
    for (int i = 0; i < columns; i++) {
      final List<num> row = [];

      for (int j = 0; j < rows; j++) {
        if (i % 2 == 0) {
          row.add(random.nextInt(5000));
        } else {
          row.add(random.nextInt(100));
        }
      }
      output.add(row);
    }
    return output;
  }

  List<String> _makeTitleColumn() => List.generate(columns, (i) {
        switch (i % 2) {
          case 0:
            {
              int data = 0;
              for (int j = 0; j < rows - 1; j++) {
                data += output[i][j];
              }
              return "$data";
            }
          case 1:
            {
              int data = 0;
              int ave = 0;
              for (int j = 0; j < rows - 1; j++) {
                data += output[i][j];
              }
              ave = (data / rows).floor();
              return "$ave%";
            }
        }
        return '';
      });

  List<String> _makeTopTitleColumn() => List.generate(topColumns, (i) {
        switch (i % 4) {
          case 0:
            {
              return "សមាជិក CPP​";
            }
          case 1:
            {
              return "អ្នកចេញទៅបោះឆ្នោត​";
            }
          case 2:
            {
              return "សន្លឹកឆ្នោតបានការ​";
            }
          case 3:
            {
              return "សន្លឹកឆ្នោត CPP​";
            }
        }
        return '';
      });

  List<String> _makeSecondTopTitleColumn() =>
      List.generate(secondTopColumns, (i) {
        switch (i) {
          case 0:
            {
              return "ចំនួន​";
            }
          case 1:
            {
              return "%នៃបញ្ជី\nគ.ជ.ប​​";
            }
          case 2:
            {
              return "ចំនួន​";
            }
          case 3:
            {
              return "%នៃបញ្ជី\nគ.ជ.ប​​";
            }
          case 4:
            {
              return "ចំនួន​";
            }
          case 5:
            {
              return "%នៃអ្នកទៅ\nបោះឆ្នោត​​";
            }
          case 6:
            {
              return "ចំនួន​";
            }
          case 7:
            {
              return "%នៃសមាជិក\nCPP​​";
            }
        }
        return '';
      });

  List<int> _makeTitleSecondRow() => List.generate(rows, (i) {
        Random random = Random();
        return random.nextInt(10);
      });

  String _secondLegendCell() {
    total = 0;
    for (int i = 0; i < rows - 1; i++) {
      total += _makeTitleSecondRow()[i];
    }
    return total.toString();
  }

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "ស្រុកល្វាម (2017)",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(
            onPressed: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
              ]);
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
        ),
        body: SafeArea(
          child: DataTableTopStickyCustom(
            cellDimensions: const CellDimensions(
                contentCellWidth: 120,
                contentCellHeight: 50,
                stickyLegendWidth: 120,
                stickyLegendHeight: 50),
            cellFit: BoxFit.cover,
            topColumnsLength: topColumns,
            secondTopColumnsLength: secondTopColumns,
            columnsLength: columns,
            rowsLength: rows,
            topColumnsTitleBuilder: (i) => TableCellCustom.topStickyRow(
              _makeTopTitleColumn()[i],
              textStyle: TextStyle(fontSize: 10, color: Colors.white),
            ),
            secondTopColumnsTitleBuilder: (i) => TableCellCustom.stickyRow(
              _makeSecondTopTitleColumn()[i],
              textStyle: TextStyle(fontSize: 12, color: Colors.white),
            ),
            columnsTitleBuilder: (i) => TableCellCustom.stickyRow(
              _makeTitleColumn()[i],
              textStyle: TextStyle(fontSize: 12),
              colorBg: Colors.green[300],
            ),
            rowsTitleBuilder: (i) => TableCellCustom.stickyColumn(
              _makeTitleRow[i],
              textStyle: const TextStyle(fontSize: 14),
              colorBg: i % 2 == 0 ? Colors.white : Colors.grey[300],
            ),
            secondRowsTitleBuilder: (i) => TableCellCustom.content(
              _makeTitleSecondRow()[i].toString(),
              textStyle: const TextStyle(fontSize: 9),
              colorBg: i % 2 == 0 ? Colors.white : Colors.grey[300],
            ),
            contentsTitleBuilder: (i, j) => TableCellCustom.content(
              i % 2 == 0 ? "${_makeData()[i][j]}" : "${_makeData()[i][j]}%",
              textStyle: TextStyle(fontSize: 9),
              colorBg: j % 2 == 0 ? Colors.white : Colors.grey[300],
            ),
            topLegendCell: TableCellCustom.legend(
              "ឃំុ",
              textStyle: TextStyle(color: Colors.white, fontSize: 14),
            ),
            legendCell: TableCellCustom.legend(
              "សរុប",
              textStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            secondTopLegendCell: TableCellCustom.legend(
              "ក្នុងបញ្ជី\nគ.ជ.ប",
              textStyle: TextStyle(color: Colors.white, fontSize: 10),
            ),
            secondLegendCell: TableCellCustom.legend(
              _secondLegendCell(),
              textStyle: TextStyle(fontSize: 14),
              colorBg: Colors.green[300],
            ),
          ),
        ),
      ),
    );
  }
}
