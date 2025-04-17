import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';

class OnboardingScreen02 extends StatelessWidget {
  final PageController controller;

  OnboardingScreen02({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final totalPages = 6;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        leadingWidth: screenSize.width * 0.4, // Make it relative to screen size
        leading: Padding(
          padding: EdgeInsets.only(left: screenSize.width * 0.05),
          child: GestureDetector(
            onTap: () {
              // Go to previous page if it's not the first one
              final currentPage = controller.page?.toInt() ?? 0;
              if (currentPage > 0) {
                controller.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back, size: screenSize.width * 0.06),
                Padding(
                  padding: EdgeInsets.only(left: screenSize.width * 0.02),
                  child: w500_14(context, 'Back', blackColor),
                ),
              ],
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Skip to the last page
              controller.jumpToPage(totalPages - 1);
            },
            child: Padding(
              padding: EdgeInsets.only(right: screenSize.width * 0.05),
              child: w500_14(context, 'Skip all', blackColor),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: screenSize.height * 0.1,
            left: screenSize.width * 0.1,
            right: screenSize.width * 0.1,
            child: Image.asset(
              'lib/assets/mock06_02.png',
              // fit: BoxFit.cover,
              // width: screenSize.width * 0.8, // Set a max width for the image
            ),
          ),
          // Foreground container with text
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenSize.height * 0.25, // 25% of the screen height
              width: screenSize.width,
              padding: EdgeInsets.all(screenSize.width * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenSize.width * 0.05),
                  topRight: Radius.circular(screenSize.width * 0.05),
                ),
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenSize.height * 0.02),
                    child: w700_27(
                      context,
                      'Mobile Transfer',
                      blackColor,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                  w400_14(
                    context,
                    'EgoFinance facilitates your mobile transfer',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    'The process is fast, smooth and seamless.',
                    blackColor,
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
