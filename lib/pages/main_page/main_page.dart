import 'package:flutter/material.dart';
import 'package:nomad_travel/pages/main_page/bottom_nav.dart';
import 'package:nomad_travel/pages/main_page/header_main_page.dart';
import 'package:nomad_travel/pages/main_page/search_text_field.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderMain(),
              SearchTextField(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
