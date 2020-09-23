import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/circle_image.dart';
import 'package:nomad_travel/common_widgets/orange_backpack.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SplashContent extends StatelessWidget {
  final String title;
  final String description;
  final String description2;
  final String image;

  const SplashContent({
    Key key,
    @required this.title,
    @required this.description,
    @required this.description2,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var isDark = Provider.of<ThemeProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OrangeBackpack(),
              Switch(
                value: isDark.getIsDark(),
                onChanged: (value) {
                  if (themeProvider.getThemeMode() == ThemeMode.light) {
                    themeProvider.setThemeMode(ThemeMode.dark);
                  } else {
                    themeProvider.setThemeMode(ThemeMode.light);
                  }
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setIsDark(value);
                },
                activeTrackColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: titleStyle,
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: normalStyle,
          ),
          SizedBox(height: 5),
          Text(
            description2,
            style: normalStyle,
          ),
          SizedBox(height: 40),
          Container(
            width: 350,
            height: 350,
            child: Stack(
              overflow: Overflow.clip,
              children: [
                Positioned(
                  left: -60,
                  child: CircleImage(
                    width: 350,
                    height: 350,
                    image: NetworkImage(image),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
