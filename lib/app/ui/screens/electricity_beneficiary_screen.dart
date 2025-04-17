import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';

class ElectricityBeneficiaryScreen extends StatefulWidget {
  const ElectricityBeneficiaryScreen({super.key});

  @override
  State<ElectricityBeneficiaryScreen> createState() =>
      _ElectricityBeneficiaryScreenState();
}

class _ElectricityBeneficiaryScreenState
    extends State<ElectricityBeneficiaryScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: w600_17(context, 'My Electricity Beneficiary', blackColor),
        centerTitle: false,
      ),
      backgroundColor: Color.fromRGBO(243, 244, 246, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: screenSize.height * 0.5,
              width: screenSize.width * 0.5,
              child: Image.asset(
                'lib/assets/electricityBenefit.png',
                fit: BoxFit.contain,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                w400_14(
                    context,
                    'You do not have a saved beneficiary. You can see',
                    Color.fromRGBO(51, 51, 51, 0.7)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                w400_14(
                    context,
                    'saved beneficiaries when you make electricity',
                    Color.fromRGBO(51, 51, 51, 0.7)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                w400_14(
                    context,
                    'payments to get a better payment experiience.',
                    Color.fromRGBO(51, 51, 51, 0.7)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
