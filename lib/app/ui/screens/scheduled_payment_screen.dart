import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class ScheduledPaymentScreen extends StatefulWidget {
  const ScheduledPaymentScreen({super.key});

  @override
  State<ScheduledPaymentScreen> createState() => _ScheduledPaymentScreenState();
}

class _ScheduledPaymentScreenState extends State<ScheduledPaymentScreen> {
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
                    Get.offAllNamed('/me/settings');
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_17(context, 'Scheduled Payments', blackColor),
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
            w400_16(
              context,
              'Schedule your recurring payments on weekly or monthly basis.',
              Color.fromRGBO(51, 51, 51, 0.2),
            ),
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.15),
              child: Image.asset('lib/assets/Payment_process.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                w500_17(
                  context,
                  'No Records',
                  secondaryColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
