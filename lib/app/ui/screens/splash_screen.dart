import 'package:billdaddy/app/utils/constants/data_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetoOnboardingPage();
  }

  _navigatetoOnboardingPage() async {
    await Future.delayed(const Duration(milliseconds: 3000));

    Get.toNamed('/onboardingScreen');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    print('hello world');
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: SizedBox(
              height: screenSize.height * 0.40,
              width: 150,
              child: Image.asset(
                'lib/assets/Group1logo.png', color: Colors.white,
                // fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Container(
                height: screenSize.height * 0.150,
                width: screenSize.width,
                child: Image.asset(
                  'lib/assets/Group4023splash01.png',
                  color: secondaryColor,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: screenSize.height * 0.150,
                width: screenSize.width,
                child: Image.asset(
                  'lib/assets/Group4022splash02.png',
                  color: secondaryColor,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
