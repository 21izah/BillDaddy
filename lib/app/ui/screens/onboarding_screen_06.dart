import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/constants/data_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth/registration_screen.dart';

class OnboardingScreen06 extends StatelessWidget {
  final PageController controller;

  OnboardingScreen06({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final totalPages = 6;
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background container
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: SweepGradient(
                startAngle: -27.51 / 180 * 3.14, // Convert degrees to radians
                colors: [
                  Color(0xFFFF4500), // Deep orange
                  Color(0xFFD2691E), // Darker, earthy orange
                  Color(0xFFFF4500), // Deep orange
                  Color(0xFFFF4500), // Deep orangeƒƒƒ
                ],
                stops: [0.0, 0.36, 0.99, 1.0],
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.75,
            left: screenSize.width * 0.1,
            right: screenSize.width * 0.1,
            child: Container(
              // height: screenSize.height * 0.2,
              // width: screenSize.width * 0.6,
              child: Image.asset(
                'lib/assets/pos_img.png',
                fit: BoxFit.contain, // Makes the image cover the area
              ),
            ),
          ),
          // AppBar content and body
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent, // Transparent AppBar
                leadingWidth: 150,
                leading: Padding(
                  padding: EdgeInsets.only(
                    left: screenSize.width * 0.05,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Go to previous page if it's not the first one
                      final currentPage = controller.page?.toInt() ?? 0;
                      if (currentPage > 0) {
                        controller.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.bounceOut,
                        );
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, color: whiteColor),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                          ),
                          child: w500_14(context, 'Back', whiteColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    // Background image
                    // Positioned(
                    //   top: screenSize.height * 0.02,
                    //   left: screenSize.width * 0.2,
                    //   child: Container(
                    //     height: screenSize.height * 0.3,
                    //     width: screenSize.width * 0.6,
                    //     child: Image.asset(
                    //       'lib/assets/card_search.png',
                    //       fit: BoxFit.contain, // Makes the image cover the area
                    //     ),
                    //   ),
                    // ),

                    // Foreground container with text
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height *
                            0.4, // Height of the text container
                        width: screenSize.width,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 20, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: w700_27(
                                  context,
                                  'ATM Card',
                                  whiteColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20.0, 5, 20, 5),
                                child: w400_14(
                                  context,
                                  'Pay and collect your ATM Card',
                                  whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller:
                    controller, // Link the controller to the SmoothPageIndicator
                count: 6, // Number of pages in the PageView
                effect: ExpandingDotsEffect(
                  strokeWidth: 24,
                  offset: 2,
                  activeDotColor: secondaryColor,
                  dotColor: iconColor,
                  dotHeight: 7,
                  dotWidth: 7,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageTransition(
                        child: RegistrationScreen(),
                        type: PageTransitionType.leftToRight
                        // duration: Duration(seconds: 1),
                        ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.04,
                    left: screenSize.width * 0.05,
                    right: screenSize.width * 0.05,
                    bottom: screenSize.height * 0.1,
                  ),
                  child: Container(
                    height: screenSize.height * 0.06,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: secondaryColor),
                    child:
                        Center(child: w400_14(context, 'Continue', whiteColor)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
