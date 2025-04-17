import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class ReportScamScreen extends StatefulWidget {
  const ReportScamScreen({super.key});

  @override
  State<ReportScamScreen> createState() => _ReportScamScreenState();
}

class _ReportScamScreenState extends State<ReportScamScreen> {
  String reportDescription = 'Choose report type';
  List<Map<String, dynamic>> reports = [
    {
      'description': 'Account Theft',
    },
    {
      'description': 'Phishing Website',
    },
    {
      'description': 'Fraud',
    },
  ];
  List<bool> isCheckedList = [false, false, false];
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background02,
      appBar: AppBar(
        centerTitle: false,
        title: w400_20(
          context,
          'Report Scam',
          blackColor,
        ),
        backgroundColor: whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: w400_14(context, 'Choose report type', blackColor),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40C4C4C4), // #C4C4C440 with 25% opacity
                      offset: Offset(0, 4), // 0px on x-axis, 4px on y-axis
                      blurRadius: 8, // 8px blur radius
                      spreadRadius: 0, // 0px spread radius (optional)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        void openReportBottomSheet() {
                          showModalBottomSheet(
                            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                            context: context,
                            builder: (context) {
                              final screenSize = MediaQuery.of(context).size;
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Container(
                                    margin: EdgeInsets.all(20),
                                    height: screenSize.height * 0.3,
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: screenSize.height * 0.3,
                                          width: screenSize.width,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: reports.length,
                                            itemBuilder: (context, index) {
                                              final report = reports[index];
                                              // Method to build each currency container
                                              Widget buildPackagesContainer({
                                                required int index,
                                                required String Name,
                                                required Size screenSize,
                                                required StateSetter setState,
                                              }) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      // Update the selected package name and price
                                                      reportDescription =
                                                          report[
                                                              'description']!;

                                                      print(reportDescription);
                                                    });
                                                    // Also update the parent widget's state
                                                    this.setState(() {});

                                                    setState(() {
                                                      for (int i = 0;
                                                          i <
                                                              isCheckedList
                                                                  .length;
                                                          i++) {
                                                        isCheckedList[i] =
                                                            (i == index);
                                                      }
                                                    });
                                                    // Close the bottom sheet after selection
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          isCheckedList[index]
                                                              ? textfieldColor
                                                              : Colors
                                                                  .transparent,
                                                    ),
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    padding: EdgeInsets.all(20),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left:
                                                                          15.0),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      w400_14(
                                                                        context,
                                                                        Name,
                                                                        blackColor,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              height: 22,
                                                              width: 22,
                                                              child: svgAsset(
                                                                'lib/assets/vright_arrow.svg',
                                                              ),
                                                            ),
                                                            // SizedBox(width: 5),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }

                                              return Column(
                                                children: [
                                                  buildPackagesContainer(
                                                    index: index,
                                                    Name:
                                                        report['description']!,
                                                    screenSize: screenSize,
                                                    setState: setState,
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        }

                        openReportBottomSheet();
                        isVisible = true;
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w400_14(context,
                                            reportDescription, blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Transform.scale(
                              scale: 0.6,
                              child: Container(
                                child: svgAsset(
                                  'lib/assets/vright_arrow.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/me/support');
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.6,
                    left: screenSize.width * 0.02,
                    right: screenSize.width * 0.02,
                    bottom: screenSize.height * 0.02,
                  ),
                  child: Visibility(
                    visible: isVisible,
                    child: Container(
                      height: screenSize.height * 0.05,
                      width: screenSize.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryColor,
                      ),
                      child: Center(
                        child: w500_17(context, 'Report New Issue', whiteColor),
                      ),
                    ),
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
