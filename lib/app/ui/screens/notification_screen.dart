import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<dynamic> messages = [
    {
      'message':
          'Don’t wait until you run out of data. Subscribe with your Egofinance app and enjoy 7% cashback instantly! Ullamco consequat aliquip consequat cupidatat veniam ullamco enim sint Lorem id excepteur eu ut tempor. Fugiat non minim minim ut nulla pariatur eu incididunt minim. Deserunt voluptate enim labore ipsum eiusmod mollit sint esse irure in cupidatat.',
      'date': 'Mar 12, 2024 16:14'
    },
    {
      'message':
          'Don’t wait until you run out of data. Subscribe with your Egofinance app and enjoy 7% cashback instantly!',
      'date': 'Mar 12, 2024 16:14'
    },
    {
      'message':
          'Don’t wait until you run out of data. Subscribe with your Egofinance app and enjoy 7% cashback instantly! Ullamco consequat aliquip consequat cupidatat veniam ullamco enim sint Lorem id excepteur eu ut tempor. Fugiat non minim minim ut nulla pariatur eu incididunt minim. Deserunt voluptate enim labore ipsum eiusmod mollit sint esse irure in cupidatat. ',
      'date': 'Mar 12, 2024 16:14'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background01,
      appBar: AppBar(
        backgroundColor: background01,
        title: w600_17(context, 'Notifications', blackColor),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            String messageText =
                messages[index]['message'] ?? 'No message available';
            String date = messages[index]['date'] ?? 'No date available';

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 42,
                          width: 42,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            'lib/assets/Group1logo.png',
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                            width:
                                8), // Add some space between the image and text
                        Expanded(
                          // Ensures text does not overflow
                          child: w500_17(
                            context,
                            'Best data deals for all networks',
                            blackColor,
                            // textAlign: TextAlign.start, // Ensures left alignment
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: w400_14(
                              context,
                              messageText,
                              blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: w400_12(context, date, blackColor),
                        ),
                        Row(
                          children: [
                            Container(
                              child: w400_12(context, 'View', secondaryColor),
                            ),
                            Container(
                              height: 10,
                              width: 10,
                              child: svgAssetCo(
                                'lib/assets/vright_arrow.svg',
                                ColorFilter.mode(blackColor, BlendMode.srcIn),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
// ReadMoreText(
//   'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
//   trimMode: TrimMode.Line,
//   trimLines: 2,
//   colorClickableText: Colors.pink,
//   trimCollapsedText: 'Show more',
//   trimExpandedText: 'Show less',
//   moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
// );
