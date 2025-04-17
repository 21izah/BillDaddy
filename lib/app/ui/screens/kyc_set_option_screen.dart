import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';
import 'kyc_verify_bvn_screen.dart';
import 'kyc_verify_nin_screen.dart';

class KycSetOptionScreen extends StatefulWidget {
  const KycSetOptionScreen({super.key});

  @override
  State<KycSetOptionScreen> createState() => _KycSetOptionScreenState();
}

class _KycSetOptionScreenState extends State<KycSetOptionScreen> {
  List<bool> isCheckedList = [false, false];
  String country = 'Nigeria';
  List<Map<String, dynamic>> verificationType = [
    {
      'name': 'National Identification Number',
      'imagePath': 'lib/assets/kyc_nin.svg',
    },
    {
      'name': 'Bank Verification Number (BVN)',
      'imagePath': 'lib/assets/kyc_bvn.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Text(''),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(children: [w700_24(context, 'Select an option', blackColor)]),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                children: [
                  w400_14(
                    context,
                    'Select any ID',
                    Color.fromRGBO(143, 154, 160, 1),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: verificationType.length,
                itemBuilder: (context, index) {
                  final report = verificationType[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        for (int i = 0; i < isCheckedList.length; i++) {
                          isCheckedList[i] = (i == index);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: textfieldColor,
                      ),
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                ),
                                child: svgAsset(report['imagePath']),
                              ),
                              Container(
                                width: screenSize.width * 0.5,
                                padding: const EdgeInsets.only(left: 15.0),
                                child: w600_14_02(
                                  context,
                                  report['name'],
                                  blackColor,
                                ),
                              ),
                            ],
                          ),
                          Checkbox.adaptive(
                            activeColor: secondaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                            value: isCheckedList[index],
                            onChanged: (value) {
                              setState(() {
                                for (int i = 0; i < isCheckedList.length; i++) {
                                  isCheckedList[i] = (i == index);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                if (isCheckedList[0]) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const KycVerifyNinScreen()),
                  );
                } else if (isCheckedList[1]) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const KycVerifyBvnScreen()),
                  );
                } else {
                  print("Please select an option");
                }
              },
              child: Container(
                height: screenSize.height * 0.06,
                width: screenSize.width,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: secondaryColor,
                ),
                child: Center(
                  child: w500_17(context, 'Next', whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
