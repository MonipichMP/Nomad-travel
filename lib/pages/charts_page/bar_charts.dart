import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:nomad_travel/helper/table_data_custom/data_table_custom.dart';
import 'package:nomad_travel/common_widgets/default_button.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:nomad_travel/helper/table_data_custom/sticky_custom.dart';
import 'package:nomad_travel/model/favorite_model.dart';
import 'package:nomad_travel/model/money_rate.dart';
import 'package:nomad_travel/model/report.dart';
import 'package:nomad_travel/model/support_party.dart';
import 'package:nomad_travel/pages/charts_page/hoz_chart.dart';
import 'package:nomad_travel/pages/charts_page/hoz_chart_original.dart';
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

  final List<MoneyRate> moneyRateData = [
    MoneyRate(DateTime(2020, 1), 4010),
    MoneyRate(DateTime(2020, 2), 4021),
    MoneyRate(DateTime(2020, 3), 4045),
    MoneyRate(DateTime(2020, 4), 4063),
    MoneyRate(DateTime(2020, 5), 4000),
    MoneyRate(DateTime(2020, 6), 4007),
    MoneyRate(DateTime(2020, 7), 4015),
    MoneyRate(DateTime(2020, 8), 4055),
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

  final List<SupportParty> supportPartyData = [
    SupportParty(2003, 23.96),
    SupportParty(2007, 62.22),
    SupportParty(2008, 52.65),
    SupportParty(2012, 48.07),
    SupportParty(2013, 31.32),
    SupportParty(2017, 46.08),
    SupportParty(2018, 74.8),
    SupportParty(2019, 41.08),
    SupportParty(2020, 14.8),
  ];

  List<String> _makeTitleColumn() => List.generate(5, (i) {
        switch (i) {
          case 0:
            {
              return "អាយុ ១៨\nឆ្នំាឡើង​​";
            }
          case 1:
            {
              return "នៅក្នុងបញ្ជី\nគ.ជ.ប​​";
            }
          case 2:
            {
              return "សមាជិក\nCPP​​";
            }
          case 3:
            {
              return "សន្លឹកឆ្នោត\nបានការ​";
            }
          case 4:
            {
              return "សន្លឹកឆ្នោត\nCPP​";
            }
        }
        return '';
      });
  List<int> _makeTitleContent = [6178, 5414, 3093, 4032, 3016];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Favorite, int>> pieSeries = [
      charts.Series(
        id: "id3",
        data: list,
        domainFn: (Favorite fav, _) => fav.id,
        measureFn: (Favorite fav, _) => fav.reviewers,
      )
    ];

    List<charts.Series<MoneyRate, DateTime>> moneyRate = [
      charts.Series(
        id: "id3",
        data: moneyRateData,
        domainFn: (MoneyRate data, _) => data.month,
        measureFn: (MoneyRate data, _) => data.rate,
        colorFn: (MoneyRate data, _) => charts.Color(r:0, g: 255, b: 0),
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

    List<charts.Series<SupportParty, String>> supportFanParty = [
      charts.Series(
          id: "id5",
          data: supportPartyData,
          colorFn: (SupportParty data, _) {
            switch (data.year) {
              case 2003:
              case 2008:
              case 2012:
                {
                  return charts.Color(r: 240, g: 10, b: 0);
                }
              case 2007:
              case 2013:
                {
                  return charts.Color(b: 240, r: 0, g: 120);
                }
              case 2017:
              case 2018:
                {
                  return charts.Color(g: 240, r: 0, b: 0);
                }
              default:
                {
                  return charts.Color(r: 255, g: 0, b: 0);
                }
            }
          },
          domainFn: (SupportParty data, _) => data.year.toString(),
          measureFn: (SupportParty data, _) => data.percent,
          labelAccessorFn: (SupportParty data, _) => '${data.percent}%')
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
                    child: charts.BarChart(
                      summaryIncome,
                      animate: true,
                      defaultInteractions: false,
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
                        tickProviderSpec: charts.StaticNumericTickProviderSpec(
                          [
                            charts.TickSpec(0),
                            charts.TickSpec(1000),
                            charts.TickSpec(2000),
                            charts.TickSpec(3000),
                            charts.TickSpec(4000),
                            charts.TickSpec(5000),
                            charts.TickSpec(6000)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Card(
              elevation: 10,
              child: Column(
                children: [
                  Text(
                    "ការបោះឆ្នោតគាំទ្រ ២០២០​",
                    style: titleStyle.copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    padding: EdgeInsets.all(8),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: charts.BarChart(
                      supportFanParty,
                      animate: true,
                      defaultInteractions: false,
                      barRendererDecorator: charts.BarLabelDecorator<String>(
                        outsideLabelStyleSpec: charts.TextStyleSpec(
                          fontSize: 12,
                        ),
                      ),
                      behaviors: [
                        charts.SlidingViewport(),
                        charts.PanAndZoomBehavior(),
                      ],
                      domainAxis: charts.OrdinalAxisSpec(
                        viewport: charts.OrdinalViewport("2003", 4)
                      ),
                      primaryMeasureAxis: charts.NumericAxisSpec(
                        tickProviderSpec: charts.StaticNumericTickProviderSpec(
                          [
                            charts.TickSpec(0),
                            charts.TickSpec(10),
                            charts.TickSpec(20),
                            charts.TickSpec(30),
                            charts.TickSpec(40),
                            charts.TickSpec(50),
                            charts.TickSpec(60),
                            charts.TickSpec(70),
                            charts.TickSpec(80)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Card(
              elevation: 10,
              child: Column(
                children: [
                  Text(
                    "ទិន្នន័យអ្នកបោះឆ្នោត ឆ្នាំ ២០២០​",
                    style: titleStyle.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    margin: EdgeInsets.all(8),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: DataTableCustom(
                      columnsLength: 5,
                      cellDimensions: const CellDimensions(
                        contentCellWidth: 70.0,
                        contentCellHeight: 50.0,
                        stickyLegendWidth: 0.0,
                        stickyLegendHeight: 0.0,
                      ),
                      columnsTitleBuilder: (i) => Text(
                        _makeTitleColumn()[i],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      contentsTitleBuilder: (i) => Text(
                        _makeTitleContent[i].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    margin: EdgeInsets.all(8),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: DataTableCustom(
                      columnsLength: 2,
                      cellDimensions: const CellDimensions(
                        contentCellWidth: 175.0,
                        contentCellHeight: 50.0,
                        stickyLegendWidth: 0.0,
                        stickyLegendHeight: 0.0,
                      ),
                      columnsTitleBuilder: (i) => Text(
                        _makeTitleColumn()[i],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      contentsTitleBuilder: (i) => Text(
                        _makeTitleContent[i].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Card(
              elevation: 10,
              child: Column(
                children: [
                  Text(
                    "អត្រាប្តូរប្រាក់",
                    style: titleStyle.copyWith(color: Colors.black),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    margin: EdgeInsets.only(left: 8),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: charts.TimeSeriesChart(
                      moneyRate,
                      animate: true,
                      defaultRenderer:
                          charts.LineRendererConfig(includePoints: true),
                      domainAxis: charts.DateTimeAxisSpec(
                        ///define how to show specific data on domain
                        tickProviderSpec: charts.StaticDateTimeTickProviderSpec(
                          [
                            charts.TickSpec(DateTime(2020, 1)),
                            charts.TickSpec(DateTime(2020, 2)),
                            charts.TickSpec(DateTime(2020, 3)),
                            charts.TickSpec(DateTime(2020, 4)),
                            charts.TickSpec(DateTime(2020, 5)),
                            charts.TickSpec(DateTime(2020, 6)),
                            charts.TickSpec(DateTime(2020, 7)),
                            charts.TickSpec(DateTime(2020, 8)),
                          ]
                        ),
                        tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                          month: charts.TimeFormatterSpec(
                              format: 'MMM', transitionFormat: "MMM"),
                        ),
                      ),
                      primaryMeasureAxis: charts.NumericAxisSpec(
                        renderSpec: charts.SmallTickRendererSpec(
                          tickLengthPx: -310,
                          labelOffsetFromAxisPx: 10
                        ),
                        tickProviderSpec: charts.StaticNumericTickProviderSpec(
                          [
                            charts.TickSpec(4000),
                            charts.TickSpec(4010),
                            charts.TickSpec(4020),
                            charts.TickSpec(4030),
                            charts.TickSpec(4040),
                            charts.TickSpec(4050),
                            charts.TickSpec(4060),
                            charts.TickSpec(4070),
                            charts.TickSpec(4080),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Card(
              elevation: 10,
              child: Column(
                children: [
                  Text(
                    "Example ",
                    style: titleStyle.copyWith(color: Colors.black),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    // color: Theme.of(context).scaffoldBackgroundColor,
                    child: Echarts(
                      theme: "dark",
                      option: '''
                            {
                              title: {
                                  text: 'asynchronous data loading example'
                              },
                              tooltip: {},
                              xAxis: {
                                type: 'category',
                                data: ['Mon', 'Tue', 'Wed']
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                name: 'Sales',
                                data: [820, 932, 901],
                                type: 'bar'
                              }]
                            }
                            ''',
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
            ),
            SizedBox(height: 10),
            Center(
              child: DefaultButton(
                height: 56,
                title: "Hoz table Original XD ?",
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HozChartOriginal(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
