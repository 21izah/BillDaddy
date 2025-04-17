import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';
import 'bottomNavigation.dart';

class SafeLockBalanceScreen extends StatefulWidget {
  const SafeLockBalanceScreen({super.key});

  @override
  State<SafeLockBalanceScreen> createState() => _SafeLockBalanceScreenState();
}

class _SafeLockBalanceScreenState extends State<SafeLockBalanceScreen> {
  // Set the endTime as the current time plus the total duration
  late int endTime;
  @override
  void initState() {
    super.initState();

    // Calculate the milliseconds for the specified duration
    final int weeksInMilliseconds = 3 * 7 * 24 * 60 * 60 * 1000; // 3 weeks
    final int daysInMilliseconds = 25 * 24 * 60 * 60 * 1000; // 25 days
    final int hoursInMilliseconds = 17 * 60 * 60 * 1000; // 17 hours
    final int minutesInMilliseconds = 42 * 60 * 1000; // 42 minutes

    // Total countdown duration in milliseconds
    final int totalDuration = weeksInMilliseconds +
        daysInMilliseconds +
        hoursInMilliseconds +
        minutesInMilliseconds;

    // Calculate the endTime as the current time plus the total duration
    endTime = DateTime.now().millisecondsSinceEpoch + totalDuration;
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background02,
      appBar: AppBar(
        backgroundColor: whiteColor,
        leadingWidth: screenSize.width,
        leading: Padding(
          padding: EdgeInsets.only(
            left: screenSize.width * 0.05,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed('/bottomNav', arguments: 0);
                    // Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_17(context, 'SafeLock Balance', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  w400_16(
                    context,
                    'Total Balance',
                    Color.fromRGBO(51, 51, 51, 1),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  w700_35(
                    context,
                    '₦ 103,800.00',
                    secondaryColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                      scale: 0.6,
                      child: Icon(
                        Icons.arrow_upward_outlined,
                        color: Color.fromRGBO(4, 140, 252, 0.7),
                      )),
                  w400_14(
                    context,
                    '+10%',
                    Color.fromRGBO(4, 140, 252, 0.7),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromRGBO(4, 140, 252, 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w400_14(
                        context,
                        'Time Remaining',
                        blackColor,
                      ),
                      Transform.scale(
                        scale: 0.7,
                        child: svgAsset(
                          'lib/assets/clarity_clock_line.svg',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: screenSize.width,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: CountdownTimer(
                        onEnd: onEnd,
                        endTime: endTime,
                        widgetBuilder: (_, CurrentRemainingTime? time) {
                          if (time == null) {
                            return w800_30(
                                context, '00:00:00:00:00', whiteColor);
                          }

                          final weeks = (time.days ?? 0) ~/
                              7; // Calculate weeks from days
                          final days = (time.days ?? 0) %
                              7; // Remaining days after weeks
                          final hours = time.hours ?? 0;
                          final minutes = time.min ?? 0;
                          final seconds = time.sec ?? 0;

                          final formattedTime =
                              '${weeks.toString().padLeft(2, '0')}:'
                              '${days.toString().padLeft(2, '0')}:'
                              '${hours.toString().padLeft(2, '0')}:'
                              '${minutes.toString().padLeft(2, '0')}:'
                              '${seconds.toString().padLeft(2, '0')}';

                          return w800_30(context, formattedTime, whiteColor);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenSize.width * 0.43,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration: BoxDecoration(
                      border: Border.all(color: secondaryColor),
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 05.0, bottom: 10, left: 10),
                        child: w400_17(
                          context,
                          'Initial Deposit',
                          blackColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        width: screenSize.width,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(5, 71, 138, 0.2),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: w500_17(
                            context,
                            '₦ 103,800.00',
                            Color.fromRGBO(4, 140, 252, 0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenSize.width * 0.43,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration: BoxDecoration(
                      border: Border.all(color: secondaryColor),
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 05.0, bottom: 10, left: 10),
                        child: w400_17(
                          context,
                          'Interest Added',
                          blackColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        width: screenSize.width,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(5, 71, 138, 0.2),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: w500_17(
                            context,
                            '₦ 1,400.00',
                            Color.fromRGBO(4, 140, 252, 0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.22),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/me/safeLock');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    w400_14(
                      context,
                      'Invest More >>>',
                      Color.fromRGBO(4, 140, 252, 0.7),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
