import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';

class FlightReturn extends StatefulWidget {
  @override
  _FlightReturnState createState() => _FlightReturnState();
}

class _FlightReturnState extends State<FlightReturn> {
  DateTime dateFrom = DateTime.now();
  DateTime dateTo = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day + 1,
  );

  String placeFrom = "PHP";
  String placeTo = "SYD";
  List cities = ["PHP", "SYD", "HNG", "BNK", "KUL", "CHM"];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          /// select destination
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text("select city"),
                            children: List.generate(
                              cities.length,
                              (index) => SimpleDialogOption(
                                child: Text(cities[index]),
                                onPressed: () {
                                  Navigator.pop(context, cities[index]);
                                  setState(() {
                                    placeFrom = cities[index];
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "From",
                            style: normalStyle.copyWith(color: AppColor.grey),
                          ),
                          Text(
                            placeFrom,
                            style: subHeaderStyle.copyWith(color: Colors.black),
                          ),
                          Text(
                            longNameCityFrom(placeFrom),
                            style: normalStyle.copyWith(color: AppColor.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text("select city"),
                            children: List.generate(
                              cities.length,
                                  (index) => SimpleDialogOption(
                                child: Text(cities[index]),
                                onPressed: () {
                                  Navigator.pop(context, cities[index]);
                                  setState(() {
                                    placeTo = cities[index];
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "To",
                            style: normalStyle.copyWith(color: AppColor.grey),
                          ),
                          Text(
                            placeTo,
                            style: subHeaderStyle.copyWith(color: Colors.black),
                          ),
                          Text(
                            longNameCityFrom(placeTo),
                            style: normalStyle.copyWith(color: AppColor.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 40,
                left: 160,
                child: InkWell(
                  onTap: () {
                    String swap;
                    setState(() {
                      swap = placeFrom;
                      placeFrom = placeTo;
                      placeTo = swap;
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.compare_arrows,
                      color: Colors.grey,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () async {
                  DateTime date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2021),
                  );
                  if (date != null) {
                    setState(() {
                      dateFrom = date;
                    });
                  }
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        DateFormat('MMM-dd-yyyy').format(dateFrom),
                        style: subtitleStyle.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  final now = DateTime.now();
                  DateTime date = await showDatePicker(
                    context: context,
                    initialDate: DateTime(now.year, now.month, now.day + 1),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2021),
                  );
                  if (date != null) {
                    setState(() {
                      dateTo = date;
                    });
                  }
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        DateFormat('MMM-dd-yyyy').format(dateTo),
                        style: subtitleStyle.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            width: 320,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "1 adult Economy",
                  style: subtitleStyle.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          /// search result
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Container(
                        width: 30,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      SizedBox(height: 20),

                      /// display listview
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String longNameCityFrom(String shortForm) {
    String city = "";
    switch (shortForm) {
      case "PHP":
        city = "Phnom Penh";
        break;
      case "SYD":
        city = "Sydney";
        break;
      case "HNG":
        city = "Hong Kong";
        break;
      case "BNK":
        city = "Bangkok";
        break;
      case "KUL":
        city = "Kuala lumpur";
        break;
      case "CHM":
        city = "Chang Mai";
        break;
    }
    return city;
  }
}
