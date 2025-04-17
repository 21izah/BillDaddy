import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'invest_screen03.dart';

class InvestScreen02 extends StatefulWidget {
  const InvestScreen02({super.key});

  @override
  State<InvestScreen02> createState() => _InvestScreen02State();
}

class _InvestScreen02State extends State<InvestScreen02> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenSize.height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: secondaryColor,
                          child: Icon(
                            Icons.person,
                            color: whiteColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: w700_18(context, 'Hello, ', blackColor),
                        ),
                        w700_18(context, 'Bola', secondaryColor),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 24,
                          width: 24,
                          child: svgAsset(
                            'lib/assets/scan01.svg',
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 24,
                          width: 24,
                          child: svgAsset(
                            'lib/assets/notificatoin.svg',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenSize.height * 0.02,
                    bottom: screenSize.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    w400_14(context, 'Total Value', blackColor),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  w800_24(context, '\$240,000', blackColor),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: svgAsset(
                      'lib/assets/in_arrow_up.svg',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    w500_14(context, 'Favorites', blackColor),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenSize.width * 0.43,
                    padding: const EdgeInsets.all(16),
                    // margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2F80ED), Color(0xFF56CCF2)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Apple logo and name
                        Row(
                          children: [
                            svgAsset(
                              'lib/assets/in_google.svg',
                            ),
                            const SizedBox(width: 8),
                            w500_14(context, 'Google', whiteColor),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Price
                        w600_20(context, '\$24.04', whiteColor),
                        const SizedBox(height: 8),
                        // Custom wavy line (simplified here)
                        Container(
                          // height: screenSize.height * 0.08,
                          width: screenSize.width * 0.2,
                          child: svgAsset(
                            'lib/assets/in_curve.svg',
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Price increase box
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.5)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                color: Colors.white,
                                size: 20,
                              ),
                              w500_14(context, '\$4.74', whiteColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenSize.width * 0.43,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2F80ED), Color(0xFF56CCF2)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Apple logo and name
                        Row(
                          children: [
                            Icon(
                              Icons
                                  .apple, // Placeholder for Apple logo, replace with actual asset if available
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            w500_14(context, 'Apple', whiteColor),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Price
                        w600_20(context, '\$24.04', whiteColor),
                        const SizedBox(height: 8),
                        // Custom wavy line (simplified here)
                        Container(
                          // height: screenSize.height * 0.08,
                          width: screenSize.width * 0.2,
                          child: svgAsset(
                            'lib/assets/in_curve.svg',
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Price increase box
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.5)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                color: Colors.white,
                                size: 20,
                              ),
                              w500_14(context, '\$4.74', whiteColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenSize.height * 0.02,
                    bottom: screenSize.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    w600_14(context, 'Portfolio', blackColor),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,

                    PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: const InvestScreen03(),
                      // duration: Duration(seconds: 1),
                    ),
                    // );
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                    0,
                    screenSize.height * 0.01,
                    0,
                    screenSize.height * 0.01,
                  ),
                  padding: EdgeInsets.fromLTRB(
                    10,
                    15,
                    20,
                    15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(217, 217, 217, 0.57),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.08), // Set the shadow color
                                  offset: Offset(
                                      0, 4), // Horizontal and vertical offset
                                  blurRadius:
                                      4, // How much the shadow should be blurred
                                ),
                              ],
                              color: Color.fromRGBO(217, 217, 217, 0.4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: svgAsset(
                              'lib/assets/in_google.svg',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(),
                                  child: w500_14(context, 'GOOGLE', blackColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          w600_14(context, '\$209.87', blackColor),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: secondaryColor,
                              ),
                              child: w600_14(context, '\$4.74', whiteColor)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,

                    PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: const InvestScreen03(),
                      // duration: Duration(seconds: 1),
                    ),
                    // );
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                    0,
                    screenSize.height * 0.01,
                    0,
                    screenSize.height * 0.01,
                  ),
                  padding: EdgeInsets.fromLTRB(
                    10,
                    15,
                    20,
                    15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(217, 217, 217, 0.57),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.08), // Set the shadow color
                                  offset: Offset(
                                      0, 4), // Horizontal and vertical offset
                                  blurRadius:
                                      4, // How much the shadow should be blurred
                                ),
                              ],
                              color: Color.fromRGBO(217, 217, 217, 0.4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons
                                  .apple, // Placeholder for Apple logo, replace with actual asset if available
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(),
                                  child: w500_14(context, 'APPLE', blackColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          w600_14(context, '\$209.87', blackColor),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: secondaryColor,
                              ),
                              child: w600_14(context, '\$4.74', whiteColor)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,

                    PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: const InvestScreen03(),
                      // duration: Duration(seconds: 1),
                    ),
                    // );
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                    0,
                    screenSize.height * 0.01,
                    0,
                    screenSize.height * 0.01,
                  ),
                  padding: EdgeInsets.fromLTRB(
                    10,
                    15,
                    20,
                    15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(217, 217, 217, 0.57),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.08), // Set the shadow color
                                  offset: Offset(
                                      0, 4), // Horizontal and vertical offset
                                  blurRadius:
                                      4, // How much the shadow should be blurred
                                ),
                              ],
                              color: Color.fromRGBO(217, 217, 217, 0.4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: svgAsset(
                              'lib/assets/in_google.svg',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(),
                                  child: w500_14(context, 'GOOGLE', blackColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          w600_14(context, '\$209.87', blackColor),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: secondaryColor,
                              ),
                              child: w600_14(context, '\$4.74', whiteColor)),
                        ],
                      ),
                    ],
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

// Custom Painter for the wavy line
class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.5,
        size.width * 0.5, size.height * 0.7);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.9, size.width, size.height * 0.7);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
