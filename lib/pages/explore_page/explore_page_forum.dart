import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/category_select.dart';
import 'package:nomad_travel/common_widgets/circle_image.dart';
import 'package:nomad_travel/common_widgets/search_text_field.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/pages/explore_page/profile_page.dart';

class MainForums extends StatefulWidget {
  @override
  _MainForumsState createState() => _MainForumsState();
}

class _MainForumsState extends State<MainForums> {
  List categoryTypes = [
    {
      "title": "Latest",
      "isSelected": true,
    },
    {
      "title": "Top",
      "isSelected": false,
    },
    {
      "title": "Unread",
      "isSelected": false,
    },
    {
      "title": "Recommended",
      "isSelected": false,
    },
  ];
  int currentIndex = 0;

  List forumDataStatic = [
    {
      "id": 1,
      "question": "How to create circle on current location in flutter",
      "userAsked": "Hardik1344",
      "date": "Jan-16-2019",
      "image": "assets/images/afgan.jpg",
      "comment": 15,
      "love": 22
    },
    {
      "id": 2,
      "question": "Change Widget on Dropdown onchange event",
      "userAsked": "harunB10",
      "date": "Aug-19-2019",
      "image": "assets/images/alb.jpg",
      "comment": 3,
      "love": 11
    },
    {
      "id": 3,
      "question":
          "A RenderFlex overflowed by 41 pixels on the bottom. The relevant error-causing widget was Column",
      "userAsked": "developer1996",
      "date": "Dec-26-2019",
      "image": "assets/images/alg.jpg",
      "comment": 3,
      "love": 22
    },
    {
      "id": 4,
      "question": "How to use stack image container?",
      "userAsked": "Sean Clark Hess",
      "date": "Jul-06-16",
      "image": "assets/images/and.jpg",
      "comment": 14,
      "love": 211
    },
    {
      "id": 5,
      "question": "How to create circle on current location in flutter",
      "userAsked": "Hardik1344",
      "date": "Jan-16-2019",
      "image": "assets/images/afgan.jpg",
      "comment": 15,
      "love": 22
    },
    {
      "id": 6,
      "question": "Change Widget on Dropdown onchange event",
      "userAsked": "harunB10",
      "date": "Aug-19-2019",
      "image": "assets/images/alb.jpg",
      "comment": 3,
      "love": 11
    },
    {
      "id": 7,
      "question":
          "A RenderFlex overflowed by 41 pixels on the bottom. The relevant error-causing widget was Column",
      "userAsked": "developer1996",
      "date": "Dec-26-2019",
      "image": "assets/images/alg.jpg",
      "comment": 3,
      "love": 22
    },
    {
      "id": 8,
      "question": "How to use stack image container?",
      "userAsked": "Sean Clark Hess",
      "date": "Jul-06-16",
      "image": "assets/images/and.jpg",
      "comment": 14,
      "love": 211
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(),
          SizedBox(height: 25),

          /// categories chip select
          Row(
            children: List.generate(
              categoryTypes.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: CategorySelect(
                  index: index,
                  title: categoryTypes[index]['title'],
                  currentIndex: currentIndex,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          /// list view of questions
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: ListView.builder(
                itemCount: forumDataStatic.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 8),

                          /// profile image
                          InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                  name: forumDataStatic[index]['userAsked'],
                                  image: forumDataStatic[index]['image'],
                                ),
                              ),
                            ),
                            child: CircleImage(
                              width: 50,
                              height: 50,
                              image:
                                  AssetImage(forumDataStatic[index]['image']),
                            ),
                          ),
                          SizedBox(width: 8),

                          /// column questions
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    forumDataStatic[index]['question'],
                                    style: titleStyle.copyWith(
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      forumDataStatic[index]['userAsked'],
                                      style: normalStyle.copyWith(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      " • ${forumDataStatic[index]['date']}",
                                      style: normalStyle.copyWith(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),

                                /// comments and love
                                Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: AppColor.grey,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.chat,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            forumDataStatic[index]['comment']
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Container(
                                      width: 50,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: AppColor.grey,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            forumDataStatic[index]['love']
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
