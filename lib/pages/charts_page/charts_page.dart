import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/pages/charts_page/bar_charts.dart';
import 'package:nomad_travel/pages/charts_page/web_view_page_inapp_webview.dart';
import 'package:nomad_travel/pages/file_manager_page/file_manager.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  String dropdownValue = "bar";
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
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
                "web",
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
            Text(
              "Charts",
              style: titleStyle.copyWith(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[300],
      ),
      drawer: navigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (dropdownValue == "bar") BarCharts(),
            if (dropdownValue == "web") WebViewPageInAppWebView(),
          ],
        ),
      ),
    );
  }

  Widget navigationDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          drawerHeader(),
          drawerBodyItem(
              icon: Icons.home,
              text: 'Web',
              onTap: () {
                _scaffoldKey.currentState.openEndDrawer();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewPageInAppWebView(),
                  ),
                );
              }),
          drawerBodyItem(
            icon: Icons.folder_open,
            text: 'File Explorer',
            onTap: () {
              _scaffoldKey.currentState.openEndDrawer();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FileManager(),
                ),
              );
            },
          ),
          drawerBodyItem(
            icon: Icons.event_note,
            text: 'Events',
            onTap: () {},
          ),
          Divider(),
          drawerBodyItem(
            icon: Icons.notifications_active,
            text: 'Notifications',
            onTap: () {},
          ),
          drawerBodyItem(
            icon: Icons.contact_phone,
            text: 'Contact Info',
            onTap: () {},
          ),
          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),

          /// let's cmt this real quick pretend that you are bc but you aren't because i regularly free and living
        ],
      ),
    );
  }

  Widget drawerHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/berlin.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text(
              "Welcome to Header",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerBodyItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
