import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class NearbyMerchantScreen extends StatefulWidget {
  const NearbyMerchantScreen({super.key});

  @override
  State<NearbyMerchantScreen> createState() => _NearbyMerchantScreenState();
}

class _NearbyMerchantScreenState extends State<NearbyMerchantScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 244, 246, 1),
      appBar: AppBar(
        backgroundColor: whiteColor,
        leadingWidth: 300,
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
                    Get.offAllNamed('/cards');
                    // Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_17(context, 'Nearby Merchant', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              height: 165,
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            // Ensures text doesn't overflow
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  padding: EdgeInsets.all(10),
                                  child: svgAsset('lib/assets/location01.svg'),
                                ),
                                SizedBox(width: 8), // Space between icon & text
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: w400_14_d(
                                            context,
                                            'Mobolaji Bank Anthony way, ikeja, Lagos.',
                                            blackColor),
                                      ),
                                      SizedBox(height: 2),
                                      Container(
                                        child: w400_12_o(
                                            context,
                                            'Add money via mobile or internet banking',
                                            blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 22,
                            width: 22,
                            child: svgAsset('lib/assets/vright_arrow.svg'),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10),
                          child: Image.asset('lib/assets/location02.png'),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: w400_14_d(context,
                              '1.78km. Ikeja under bridge.', blackColor),
                        ),
                      ],
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
