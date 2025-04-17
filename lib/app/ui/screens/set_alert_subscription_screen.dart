import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class setAlertSubscriptionScreen extends StatefulWidget {
  const setAlertSubscriptionScreen({super.key});

  @override
  State<setAlertSubscriptionScreen> createState() =>
      _setAlertSubscriptionScreenState();
}

class _setAlertSubscriptionScreenState
    extends State<setAlertSubscriptionScreen> {
  bool isCreditChecked = false;
  bool isCardTransactionChecked = false;
  bool isTransferAndWithdrawalChecked = false;
  bool isOtherAlertChecked = false;
  List<bool> isCheckedList = [
    false,
    false,
    false,
    false,
  ];
  List<Map<String, dynamic>> subscriptionPackages = [
    {
      'name': 'Credit alerts',
      'subName': 'Money sent to your zarapay account',
    },
    {
      'name': 'Card transaction alerts',
      'subName': 'Payment and cash withdrawal made with your zarapay card.',
    },
    {
      'name': 'Transfer and withdrawal alerts',
      'subName': 'Transfers or cash withdrawals made with zarapay app.',
    },
    {
      'name': 'Other alerts',
      'subName': 'Other transactions such as betting, airtime, data and so on.',
    },
  ];
  // Method to build each currency container
  Widget buildSubPackages({
    required int index,
    required String packageName,
    required String packagesubName,
    required Size screenSize,
    required StateSetter setState,
  }) {
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
          color: isCheckedList[index] ? textfieldColor : textfieldColor,
        ),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  child: Checkbox.adaptive(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: secondaryColor)),
                    value: isCheckedList[index],
                    onChanged: (value) {
                      setState(() {
                        for (int i = 0; i < isCheckedList.length; i++) {
                          isCheckedList[i] = (i == index);
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          w400_14(
                            context,
                            packageName,
                            blackColor,
                          ),
                        ],
                      ),
                      SizedBox(width: 5),
                      w400_14(
                        context,
                        packagesubName,
                        cardRadialColor01,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
                    Get.offAllNamed('/me/settings');
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_17(context, 'Set Alert Subscription', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              w400_16(
                context,
                'You will receive an SMS alert after successful subscription.',
                Color.fromRGBO(51, 51, 51, 0.2),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    w400_16(
                      context,
                      'Select subscription option(s):',
                      Color.fromRGBO(51, 51, 51, 0.2),
                    ),
                  ],
                ),
              ),
              StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    margin: EdgeInsets.all(0),
                    height: screenSize.height,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          // height: screenSize.height * 0.4,
                          // width: screenSize.width,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: textfieldColor,
                                  ),
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          children: [
                                            Checkbox.adaptive(
                                              activeColor: secondaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              value: isCreditChecked,
                                              onChanged: (value) =>
                                                  setState(() {
                                                isCreditChecked =
                                                    value ?? false;
                                              }),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                          child: w400_14(
                                                            context,
                                                            subscriptionPackages[
                                                                0]['name'],
                                                            blackColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 5),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.65,
                                                      child: Expanded(
                                                        child: w400_14(
                                                          context,
                                                          subscriptionPackages[
                                                              0]['subName'],
                                                          cardRadialColor01,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: textfieldColor,
                                  ),
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          children: [
                                            Checkbox.adaptive(
                                              activeColor: secondaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              value: isCreditChecked,
                                              onChanged: (value) =>
                                                  setState(() {
                                                isCreditChecked =
                                                    value ?? false;
                                              }),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                          child: w400_14(
                                                            context,
                                                            subscriptionPackages[
                                                                1]['name'],
                                                            blackColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 5),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.65,
                                                      child: Expanded(
                                                        child: w400_14(
                                                          context,
                                                          subscriptionPackages[
                                                              0]['subName'],
                                                          cardRadialColor01,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: textfieldColor,
                                  ),
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          children: [
                                            Checkbox.adaptive(
                                              activeColor: secondaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              value: isCreditChecked,
                                              onChanged: (value) =>
                                                  setState(() {
                                                isCreditChecked =
                                                    value ?? false;
                                              }),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                          child: w400_14(
                                                            context,
                                                            subscriptionPackages[
                                                                2]['name'],
                                                            blackColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 5),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.65,
                                                      child: Expanded(
                                                        child: w400_14(
                                                          context,
                                                          subscriptionPackages[
                                                              0]['subName'],
                                                          cardRadialColor01,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: textfieldColor,
                                  ),
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          children: [
                                            Checkbox.adaptive(
                                              activeColor: secondaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              value: isCreditChecked,
                                              onChanged: (value) =>
                                                  setState(() {
                                                isCreditChecked =
                                                    value ?? false;
                                              }),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                          child: w400_14(
                                                            context,
                                                            subscriptionPackages[
                                                                3]['name'],
                                                            blackColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 5),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.65,
                                                      child: Expanded(
                                                        child: w400_14(
                                                          context,
                                                          subscriptionPackages[
                                                              0]['subName'],
                                                          cardRadialColor01,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: screenSize.height * 0.15),
                          alignment: Alignment.center,
                          height: 40,
                          width: screenSize.width,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: w500_14(context, 'Subscribe Now', whiteColor),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
