import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/pages/charts_page/bar_charts.dart';
import 'package:nomad_travel/pages/charts_page/hoz_chart.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  String dropdownValue = "bar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.keyboard_arrow_down),
          elevation: 0,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          dropdownColor: Theme.of(context).scaffoldBackgroundColor,
          items: <String>[
            "bar",
            "hoz",
          ].map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
        ),
        title: Text(
          ">< Charts ><",
          style: titleStyle.copyWith(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (dropdownValue == "bar") BarCharts(),
            if (dropdownValue == "hoz") HozChart(),
          ],
        ),
      ),
    );
  }
}
