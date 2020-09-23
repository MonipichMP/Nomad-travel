import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/default_button.dart';
import 'package:nomad_travel/common_widgets/search_text_field.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/model/job_model.dart';
import 'package:nomad_travel/pages/job_page/job_detail_page.dart';

class DesignerJobPage extends StatefulWidget {
  @override
  _DesignerJobPageState createState() => _DesignerJobPageState();
}

class _DesignerJobPageState extends State<DesignerJobPage> {
  List<Job> jobList = [
    Job(
      id: 1,
      name: "UI/UX Designer",
      company: "Google LLc",
      city: "Los Angeles",
      country: "CA",
      image: "assets/images/aus.jpg",
      description:
          "We need UI/UX Designer who response on include gathering user requirements, designing",
      salary: "\$80,000 -\$90,000 a year",
    ),
    Job(
      id: 2,
      name: "Product Designer",
      company: "Facebook, Inc",
      city: "Menlo Park",
      country: "CA",
      image: "assets/images/bali.jpg",
      description:
          "We are looking for an outstanding web designer who is passionate about",
      salary: "\$129,000 a year",
    ),
    Job(
      id: 3,
      name: "Visual Designer",
      company: "Uber Inc",
      city: "San Francisco",
      country: "CA",
      image: "assets/images/afgan.jpg",
      description:
          "You will be collaborating with Brand Directors, Industrial Designers, UI/UX",
      salary: "\$70,000 -\$80,000 a year",
    ),
    Job(
      id: 4,
      name: "UI/UX Designer",
      company: "Google LLc",
      city: "Los Angeles",
      country: "CA",
      image: "assets/images/aus.jpg",
      description:
          "We need UI/UX Designer who response on include gathering user requirements, designing",
      salary: "\$80,000 -\$90,000 a year",
    ),
    Job(
      id: 5,
      name: "Product Designer",
      company: "Facebook, Inc",
      city: "Menlo Park",
      country: "CA",
      image: "assets/images/bali.jpg",
      description:
          "We are looking for an outstanding web designer who is passionate about",
      salary: "\$129,000 a year",
    ),
    Job(
      id: 6,
      name: "Visual Designer",
      company: "Uber Inc",
      city: "San Francisco",
      country: "CA",
      image: "assets/images/afgan.jpg",
      description:
          "You will be collaborating with Brand Directors, Industrial Designers, UI/UX",
      salary: "\$70,000 -\$80,000 a year",
    ),
  ];
  List experienceLevels = [
    "Entry Level",
    "Mid Level",
    "Senior Level",
  ];
  RangeValues values = RangeValues(10, 100);
  String groupValue = "full-time";
  String selectedExperienceLevel = "Mid Level";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: SearchTextField()),
              SizedBox(width: 8),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          width: double.infinity,
                          height: 500,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 30,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                SizedBox(height: 20),

                                ///range slider salary
                                Text(
                                  "Salary Estimate",
                                  style: titleStyle.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 20),
                                StatefulBuilder(
                                  builder: (context, setState) {
                                    return Column(
                                      children: [
                                        RangeSlider(
                                          min: 1,
                                          max: 100,
                                          values: values,
                                          activeColor: AppColor.blue,
                                          labels: RangeLabels(
                                            values.start.round().toString(),
                                            values.end.round().toString(),
                                          ),
                                          onChanged: (RangeValues value) {
                                            setState(() {
                                              values = value;
                                            });
                                          },
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "\$${values.start.round()},000",
                                              style: normalStyle.copyWith(
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "\$${values.end.round()},000",
                                              style: normalStyle.copyWith(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(height: 20),

                                /// radio job type
                                Text(
                                  "Job Type",
                                  style: titleStyle.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 20),
                                StatefulBuilder(
                                  builder: (context, setState) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        /// left fling column
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Radio(
                                                    activeColor: AppColor.blue,
                                                    value: "full-time",
                                                    groupValue: groupValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        groupValue = value;
                                                      });
                                                    }),
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text: "Full time",
                                                      style:
                                                          normalStyle.copyWith(
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text: " (45)",
                                                      style:
                                                          captionStyle.copyWith(
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Radio(
                                                    activeColor: AppColor.blue,
                                                    value: "contract",
                                                    groupValue: groupValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        groupValue = value;
                                                      });
                                                    }),
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text: "Contract",
                                                      style:
                                                          normalStyle.copyWith(
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text: " (18)",
                                                      style:
                                                          captionStyle.copyWith(
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Radio(
                                                    activeColor: AppColor.blue,
                                                    value: "temporary",
                                                    groupValue: groupValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        groupValue = value;
                                                      });
                                                    }),
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text: "Temporary",
                                                      style:
                                                          normalStyle.copyWith(
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text: " (32)",
                                                      style:
                                                          captionStyle.copyWith(
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        /// right fling column
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Radio(
                                                    activeColor: AppColor.blue,
                                                    value: "part-time",
                                                    groupValue: groupValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        groupValue = value;
                                                      });
                                                    }),
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text: "Part time",
                                                      style:
                                                          normalStyle.copyWith(
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text: " (21)",
                                                      style:
                                                          captionStyle.copyWith(
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Radio(
                                                    activeColor: AppColor.blue,
                                                    value: "internship",
                                                    groupValue: groupValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        groupValue = value;
                                                      });
                                                    }),
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text: "Internship",
                                                      style:
                                                          normalStyle.copyWith(
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text: " (13)",
                                                      style:
                                                          captionStyle.copyWith(
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Radio(
                                                    activeColor: AppColor.blue,
                                                    value: "commission",
                                                    groupValue: groupValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        groupValue = value;
                                                      });
                                                    }),
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text: "Commission",
                                                      style:
                                                          normalStyle.copyWith(
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text: " (32)",
                                                      style:
                                                          captionStyle.copyWith(
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(height: 15),
                                Text(
                                  "Experience Level",
                                  style: titleStyle.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 20),
                                StatefulBuilder(
                                  builder: (context, setState) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: List.generate(
                                        experienceLevels.length,
                                        (index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedExperienceLevel =
                                                    experienceLevels[index];
                                              });
                                            },
                                            child: Text(
                                              experienceLevels[index],
                                              style: selectedExperienceLevel ==
                                                      experienceLevels[index]
                                                  ? subtitleStyle.copyWith(
                                                      color: AppColor.blue)
                                                  : normalStyle.copyWith(
                                                      color: Colors.black),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 20),
                                DefaultButton(
                                  height: 46,
                                  title: "Submit",
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 15),

          /// list view of jobs
          Expanded(
            child: ListView.builder(
              itemCount: jobList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => JobDetailPage(
                        name: jobList[index].name,
                        company: jobList[index].company,
                        city: jobList[index].city,
                        country: jobList[index].country,
                        image: jobList[index].image,
                        description: jobList[index].description,
                        salary: jobList[index].salary,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// row logo and job name
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// profile image
                                Container(
                                  height: 45,
                                  width: 45,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(jobList[index].image),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          jobList[index].name,
                                          style: titleStyle.copyWith(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "${jobList[index].company}, ${jobList[index].city}, ${jobList[index].country}",
                                        style: normalStyle.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            ///description
                            SizedBox(height: 10),
                            Text(
                              jobList[index].description,
                              style: normalStyle.copyWith(color: Colors.grey),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10),
                            Text(
                              jobList[index].salary,
                              style: normalStyle.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
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
