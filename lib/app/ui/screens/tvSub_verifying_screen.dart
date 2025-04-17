import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/data_constant.dart';
import 'tvSubSuccessful_screen.dart';

class TvsubVerifyingScreen extends StatefulWidget {
  const TvsubVerifyingScreen({super.key});

  @override
  State<TvsubVerifyingScreen> createState() => _TvsubVerifyingScreenState();
}

class _TvsubVerifyingScreenState extends State<TvsubVerifyingScreen> {
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  _navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 3)); // wait for 3 seconds
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TvsubsuccessfulScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Lottie.asset('lib/assets/checkAnimation.json'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20),
              child: w700_20(context, 'Verifying...', blackColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                w400_14(context, 'Kindly wait for some minutes',
                    Color.fromRGBO(51, 51, 51, 0.7)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
