import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/search_text_field.dart';
import 'package:nomad_travel/constants/style.dart';

class MainCountries extends StatefulWidget {
  @override
  _MainCountriesState createState() => _MainCountriesState();
}

class _MainCountriesState extends State<MainCountries> {
  List countries = [
    {
      "name": "Afghanistan",
      "flag": "assets/images/afgan.jpg",
    },
    {
      "name": "Albania",
      "flag": "assets/images/alb.jpg",
    },
    {
      "name": "Algeria",
      "flag": "assets/images/alg.jpg",
    },
    {
      "name": "Andorra",
      "flag": "assets/images/and.jpg",
    },
    {
      "name": "Australia",
      "flag": "assets/images/aus.jpg",
    },
    {
      "name": "Afghanistan",
      "flag": "assets/images/afgan.jpg",
    },
    {
      "name": "Albania",
      "flag": "assets/images/alb.jpg",
    },
    {
      "name": "Algeria",
      "flag": "assets/images/alg.jpg",
    },
    {
      "name": "Andorra",
      "flag": "assets/images/and.jpg",
    },
    {
      "name": "Australia",
      "flag": "assets/images/aus.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SearchTextField(),
          SizedBox(height: 25),
          Expanded(
            child: GridView.builder(
              itemCount: countries.length,
              physics: BouncingScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(countries[index]['flag']),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                countries[index]['name'],
                                style:
                                    subtitleStyle.copyWith(color: Colors.black),
                              ),
                            ],
                          ),
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
    );
  }
}
