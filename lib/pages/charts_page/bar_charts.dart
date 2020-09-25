import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/default_button.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:nomad_travel/model/favorite_model.dart';
import 'package:nomad_travel/model/report.dart';
import 'package:nomad_travel/pages/charts_page/hoz_chart.dart';

class BarCharts extends StatefulWidget {
  @override
  _BarChartsState createState() => _BarChartsState();
}

class _BarChartsState extends State<BarCharts> {
  final List<Favorite> list = [
    Favorite(
      id: 1,
      name: "Seoul",
      image: "assets/images/bali.jpg",
      rating: 4.7,
      reviewers: 1468,
      isFavorite: true,
    ),
    Favorite(
      id: 2,
      name: "New York",
      image: "assets/images/bangkok.jpg",
      rating: 5.0,
      reviewers: 632,
      isFavorite: true,
    ),
    Favorite(
      id: 3,
      name: "London",
      image: "assets/images/berlin.jpg",
      rating: 4.1,
      reviewers: 549,
      isFavorite: true,
    ),
    Favorite(
      id: 4,
      name: "Seoul",
      image: "assets/images/bali.jpg",
      rating: 4.7,
      reviewers: 1468,
      isFavorite: true,
    ),
    Favorite(
      id: 5,
      name: "New York",
      image: "assets/images/bangkok.jpg",
      rating: 5.0,
      reviewers: 632,
      isFavorite: true,
    ),
    Favorite(
      id: 6,
      name: "London",
      image: "assets/images/berlin.jpg",
      rating: 4.1,
      reviewers: 549,
      isFavorite: true,
    ),
  ];

  final List<ReportSummary> summaryData = [
    ReportSummary(
      "2020",
      "GDT",
      "5,788.65(100.00%) = 1,415,663,358.88\$",
      5788.65,
    ),
    ReportSummary(
      "2020",
      "GDCE",
      "4,134.50(100.00%) = 1,011,127,352.61\$",
      4134.50,
    ),
    ReportSummary(
      "2020",
      "Non-Tax",
      "905.87(100%) = 221,538,518.74\$",
      905.87,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Favorite, String>> series = [
      charts.Series(
        id: "id1",
        data: list,
        domainFn: (Favorite fav, _) => fav.name,
        measureFn: (Favorite fav, _) => fav.rating,
      )
    ];

    List<charts.Series<Favorite, int>> lineSeries = [
      charts.Series(
        id: "id2",
        data: list,
        domainFn: (Favorite fav, _) => fav.id,
        measureFn: (Favorite fav, _) => fav.rating,
      )
    ];

    List<charts.Series<Favorite, int>> pieSeries = [
      charts.Series(
        id: "id3",
        data: list,
        domainFn: (Favorite fav, _) => fav.id,
        measureFn: (Favorite fav, _) => fav.reviewers,
      )
    ];

    List<charts.Series<ReportSummary, String>> summaryIncome = [
      charts.Series(
          id: "id4",
          data: summaryData,
          colorFn: (ReportSummary data, _) {
            switch (data.name) {
              case "GDT":
                {
                  return charts.Color(r: 240, g: 0, b: 0);
                }
              case "GDCE":
                {
                  return charts.Color(b: 240, r: 0, g: 0);
                }
              case "Non-Tax":
                {
                  return charts.Color(g: 240, r: 0, b: 0);
                }

              default:
                {
                  return charts.Color(r: 255, g: 0, b: 0);
                }
            }
          },
          domainFn: (ReportSummary data, _) => data.name,
          measureFn: (ReportSummary data, _) => data.value,
          labelAccessorFn: (ReportSummary data, _) => '\$${data.percent}')
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Text(
              "Pie Chart",
              style: titleStyle.copyWith(color: Colors.grey),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: charts.PieChart(
                pieSeries,
                animate: true,
                defaultRenderer: charts.ArcRendererConfig(
                  arcRendererDecorators: [
                    charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.outside)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),

            /// summary report table
            Card(
              elevation: 10,
              child: Column(
                children: [
                  Text(
                    "Summary Income 2020",
                    style: titleStyle.copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    padding: EdgeInsets.all(8),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: AbsorbPointer(
                      absorbing: true,
                      child: charts.BarChart(
                        summaryIncome,
                        animate: true,
                        barRendererDecorator: charts.BarLabelDecorator<String>(
                          labelPadding: 3,
                          outsideLabelStyleSpec: charts.TextStyleSpec(
                            fontSize: 7,
                          ),
                        ),
                        domainAxis: charts.OrdinalAxisSpec(
                          showAxisLine: true,
                        ),
                        primaryMeasureAxis: charts.NumericAxisSpec(
                            tickProviderSpec:
                                charts.StaticNumericTickProviderSpec([
                          charts.TickSpec(0),
                          charts.TickSpec(1000),
                          charts.TickSpec(2000),
                          charts.TickSpec(3000),
                          charts.TickSpec(4000),
                          charts.TickSpec(5000),
                          charts.TickSpec(6000)
                        ])),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: DefaultButton(
                height: 56,
                title: "Hoz table Check !",
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HozChart(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
