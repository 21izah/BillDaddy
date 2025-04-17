import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/constants/data_constant.dart';
import 'onboarding_screen_01.dart';
import 'onboarding_screen_02.dart';
import 'onboarding_screen_03.dart';
import 'onboarding_screen_04.dart';
import 'onboarding_screen_05.dart';
import 'onboarding_screen_06.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  int currentPage = 0; // Track the current page

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final totalPages = 6; // Total number of pages in PageView

    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [
          Container(
            // duration: Duration(milliseconds: 300),

            height: currentPage == totalPages - 1
                ? screenSize.height // Full height for the last page
                : screenSize.height * 0.78, // 70% height for other pages
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index; // Update the current page index
                });
              },
              itemCount: totalPages,
              physics: ClampingScrollPhysics(), // Ensure smooth sliding
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return OnboardingScreen01(controller: controller);
                  case 1:
                    return OnboardingScreen02(controller: controller);
                  case 2:
                    return OnboardingScreen03(controller: controller);
                  case 3:
                    return OnboardingScreen04(controller: controller);
                  case 4:
                    return OnboardingScreen05(controller: controller);
                  case 5:
                    return OnboardingScreen06(controller: controller);
                  default:
                    return Container(); // Fallback for safety
                }
              },
            ),
          ),
          // Only show the SmoothPageIndicator if not on the last page
          if (currentPage < totalPages - 1)
            Container(
              child: SmoothPageIndicator(
                controller: controller,
                count: totalPages, // Total number of pages
                effect: ExpandingDotsEffect(
                  strokeWidth: 24,
                  offset: 2,
                  activeDotColor: secondaryColor,
                  dotColor: iconColor,
                  dotHeight: 7,
                  dotWidth: 7,
                ),
              ),
            ),

          if (currentPage < totalPages - 1)
            GestureDetector(
              onTap: () {
                if (currentPage < totalPages - 1) {
                  controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.05,
                  left: screenSize.width * 0.05,
                  right: screenSize.width * 0.05,
                  bottom: screenSize.height * 0.05,
                ),
                child: Container(
                  height: screenSize.height * 0.06,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: secondaryColor,
                  ),
                  child: Center(
                    child: w400_14(
                      context,
                      currentPage == totalPages - 1 ? 'Continue' : 'Next',
                      whiteColor,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
