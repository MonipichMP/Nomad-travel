import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/circle_image.dart';
import 'package:nomad_travel/common_widgets/timeline_tile.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/model/timeline.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String image;

  const ProfilePage({Key key, this.name, this.image}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final timeLineUser = Timeline(
    id: 1,
    nameUser: "developer1996",
    time: ["8:00 am", "10:00 am", "1:00 pm", "5:00 pm"],
    nameHotel: [
      "Hotel Grande",
      "De Le Brong Hotel",
      "Hotel Geroad",
      "De Le Hotel",
    ],
    assetHotel: [
      "assets/images/alb.jpg",
      "assets/images/alg.jpg",
      "assets/images/afgan.jpg",
      "assets/images/bali.jpg"
    ],
    status: ["check-in", "Singapore", "KualaLumpur", "Malaysia"],
    rating: [4.5, 4.3, 3.6, 4.1],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.grey,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// top buttons
            IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
              onPressed: () => Navigator.pop(context),
            ),

            IconButton(
              icon: Icon(
                Icons.file_upload,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView(
            children: [
              /// map and grey container
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/images/map_from_one_to_another.png"),
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 30,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(3)),
                      ),
                    ),
                  ),
                ],
              ),

              /// information user
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleImage(
                      height: 65,
                      width: 65,
                      image: AssetImage(widget.image),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: subHeaderStyle.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Digital nomad and Designer",
                          style: subtitleStyle.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "contact me at abc@gmail.com",
                          style: subtitleStyle.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 20),

                        ///button follow
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 35,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: AppColor.blue,
                                onPressed: () {},
                                child: Text(
                                  "Follow",
                                  style: subtitleStyle,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: AppColor.grey,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Icon(
                                Icons.mail_outline,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        ///followers list
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Followers",
                                  style: subtitleStyle.copyWith(
                                      color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Following",
                                  style: subtitleStyle.copyWith(
                                      color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Trips",
                                  style: subtitleStyle.copyWith(
                                      color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Countries",
                                  style: subtitleStyle.copyWith(
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(width: 120),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "7,352",
                                  style: subtitleStyle.copyWith(
                                      color: Colors.black),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "273",
                                  style: subtitleStyle.copyWith(
                                      color: Colors.black),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "16",
                                  style: subtitleStyle.copyWith(
                                      color: Colors.black),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "7",
                                  style: subtitleStyle.copyWith(
                                      color: Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              /// timeline
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: timeLineUser.nameHotel.length,
                    itemBuilder: (context, index) {
                      return TimelineTileCustom(
                        assetHotel: timeLineUser.assetHotel[index],
                        nameHotel: timeLineUser.nameHotel[index],
                        status: timeLineUser.status[index],
                        rating: timeLineUser.rating[index],
                        time: timeLineUser.time[index],
                        index: index,
                        length: timeLineUser.nameHotel.length,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
