import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/default_button.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/pages/sign_up_page/sign_up_screen.dart';
import 'package:nomad_travel/pages/walk_through_page/components/splash_content.dart';

class WalkThroughPage extends StatefulWidget {
  @override
  _WalkThroughPageState createState() => _WalkThroughPageState();
}

class _WalkThroughPageState extends State<WalkThroughPage> {
  int currentIndex = 0;
  List<Map<String, String>> splashData = [
    {
      'title': "Nomad iOS UI Kit",
      'description': "Best Travel Tool to Discover New",
      'description2': "Possibilities Around the World",
      'image':
          "https://i.pinimg.com/564x/8a/fc/4d/8afc4d70639ab85fb9dfffa9e0caaf1c.jpg",
    },
    {
      'title': "Travel Alots",
      'description': "Explore things around the world",
      'description2': "Before everything was late",
      'image':
          "https://i.pinimg.com/564x/ea/3d/d4/ea3dd47276b865c44d253c028da19a06.jpg",
    },
    {
      'title': "Precious Things",
      'description': "Fresh look make you relaxing",
      'description2': "Enjoy your life with it",
      'image':
          "https://i.pinimg.com/564x/63/15/22/631522d0ecd19a6bd3831e453c89d041.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              flex: 5,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  title: splashData[index]['title'],
                  description: splashData[index]['description'],
                  description2: splashData[index]['description2'],
                  image: splashData[index]['image'],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(
                        index: index,
                      ),
                    ),
                  ),
                  Spacer(flex: 2),
                  DefaultButton(
                    height: 56,
                    color: AppColor.blue,
                    title: "Get Started",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color:
            currentIndex == index ? AppColor.blackBackground : AppColor.white,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
