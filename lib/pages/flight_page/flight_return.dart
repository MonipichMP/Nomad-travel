import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/circle_image.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/pages/flight_page/flight_card_book.dart';

class FlightReturn extends StatefulWidget {
  @override
  _FlightReturnState createState() => _FlightReturnState();
}

class _FlightReturnState extends State<FlightReturn> {
  ///date
  DateTime dateFrom = DateTime.now();
  DateTime dateTo = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day + 1,
  );

  /// single variable
  String placeFrom = "PHP";
  String placeTo = "SYD";
  int typeSelected = 1;

  /// list variable
  List cities = ["PHP", "SYD", "HNG", "BNK", "KUL", "CHM"];
  List types = List.generate(10, (index) => index + 1);
  List results = [
    {
      "id": 1,
      "image": "assets/images/sun.jpg",
      "timeStart": "14:10",
      "timeArrive": "12:15",
      "stop": "1 stop",
      "duration": "36h 5mn",
      "price": "\$980"
    },
    {
      "id": 2,
      "image": "assets/images/map.jpeg",
      "timeStart": "14:10",
      "timeArrive": "7:30",
      "stop": "1 stop",
      "duration": "31h 20mn",
      "price": "\$1160"
    },
    {
      "id": 3,
      "image": "assets/images/berlin.jpg",
      "timeStart": "17:25",
      "timeArrive": "06:30",
      "stop": "1 stop",
      "duration": "27h 5mn",
      "price": "\$1205"
    },
    {
      "id": 4,
      "image": "assets/images/aus.jpg",
      "timeStart": "17:25",
      "timeArrive": "06:10",
      "stop": "Non stop",
      "duration": "26h 45mn",
      "price": "\$1340"
    },
    {
      "id": 5,
      "image": "assets/images/and.jpg",
      "timeStart": "10:10",
      "timeArrive": "20:25",
      "stop": "Non stop",
      "duration": "24h 15mn",
      "price": "\$1500"
    },
    {
      "id": 6,
      "image": "assets/images/afgan.jpg",
      "timeStart": "17:25",
      "timeArrive": "06:30",
      "stop": "1 stop",
      "duration": "27h 5mn",
      "price": "\$1205"
    },
  ];

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
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "From",
                            style: normalStyle.copyWith(color: AppColor.white),
                          ),
                          Text(
                            placeFrom,
                            style: subHeaderStyle.copyWith(color: Colors.black),
                          ),
                          Text(
                            longNameCityFrom(placeFrom),
                            style: normalStyle.copyWith(color: AppColor.white),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "To",
                            style: normalStyle.copyWith(color: AppColor.white),
                          ),
                          Text(
                            placeTo,
                            style: subHeaderStyle.copyWith(color: Colors.black),
                          ),
                          Text(
                            longNameCityFrom(placeTo),
                            style: normalStyle.copyWith(color: AppColor.white),
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
                      color: Colors.grey[400],
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
                      color: Colors.grey[400],
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
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return SimpleDialog(
                    title: Text("select type"),
                    children: List.generate(
                      types.length,
                      (index) => SimpleDialogOption(
                        child: Text("${types[index]} adult(s) Economy"),
                        onPressed: () {
                          Navigator.pop(context, types[index]);
                          setState(() {
                            typeSelected = types[index];
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "$typeSelected adult(s) Economy",
                    style: subtitleStyle.copyWith(color: Colors.black),
                  ),
                ],
              ),
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

                      /// display list view
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: results.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FlightCardBook(
                                    title: "some titles",
                                    placeFrom: placeFrom,
                                    placeTo: placeTo,
                                    image: results[index]['image'],
                                    reviewer: 1121,
                                    price: results[index]['price'],
                                    distance: 123,
                                    star: 4,
                                  ),
                                ),
                              ),
                              child: ListTile(
                                leading: CircleImage(
                                  width: 40,
                                  height: 40,
                                  image: AssetImage(results[index]['image']),
                                ),
                                title: Text.rich(
                                  TextSpan(
                                    style: subtitleStyle.copyWith(
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                          text: results[index]['timeStart']),
                                      TextSpan(text: " - "),
                                      TextSpan(
                                          text: results[index]['timeArrive'])
                                    ],
                                  ),
                                ),
                                subtitle: Text.rich(
                                  TextSpan(
                                    style: captionStyle.copyWith(
                                        color: Colors.grey),
                                    children: [
                                      TextSpan(text: results[index]['stop']),
                                      TextSpan(text: ", "),
                                      TextSpan(text: results[index]['duration'])
                                    ],
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      results[index]['price'],
                                      style: titleStyle.copyWith(
                                          color: Colors.black),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.grey,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
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
