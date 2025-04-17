import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import '../../utils/constants/nav_ids.dart';
import 'bottomNavigation.dart';
import 'recharge_successful_screen.dart';

class RechargeScreen extends StatefulWidget {
  const RechargeScreen({super.key});

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  final _airtimeController = TextEditingController();
  final _amountController = TextEditingController();
  // Create a list to track the checked state of each container
  List<bool> isCheckedList = [false, false, false]; // Assuming 3 containers
  @override
  void dispose() {
    _airtimeController.dispose();
    _amountController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    void _showBottomDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter, // Align at the bottom
            child: Padding(
              padding: const EdgeInsets.all(0.0), // Optional padding
              child: Material(
                color: Colors.transparent, // Make the background transparent
                child: Container(
                  margin:
                      EdgeInsets.fromLTRB(10, 0, 10, screenSize.height * 0.02),
                  width: MediaQuery.of(context).size.width, // Full width
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize:
                        MainAxisSize.min, // Take up minimum vertical space
                    children: [
                      w700_16(context, 'Biometric authentication required',
                          blackColor),
                      SizedBox(height: screenSize.height * 0.01),
                      w400_14_02(
                        context,
                        'Verify Identity',
                        Color.fromRGBO(143, 154, 160, 1),
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageTransition(
                                child: RechargeSuccessfulScreen(),
                                type: PageTransitionType.leftToRight
                                // duration: Duration(seconds: 1),
                                ),
                          );
                        },
                        child: Container(
                          // color: secondaryColor,
                          height: screenSize.height * 0.06,
                          width: screenSize.width * 0.2,
                          child: svgAsset(
                            'lib/assets/fingerPrint.svg',
                          ),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      w400_14_02(
                        context,
                        'Scan Fingerprint to authenticate',
                        Color.fromRGBO(143, 154, 160, 1),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: w400_14(
                          context,
                          'Cancel',
                          blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    void openBottomSheet() {
      showModalBottomSheet(
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        backgroundColor: whiteColor,
        context: context,
        builder: (context) {
          return StatefulBuilder(
            // Use StatefulBuilder to manage the Checkbox state within the BottomSheet
            builder: (context, setState) {
              return Container(
                margin: EdgeInsets.all(20),
                // height: screenSize.height * 0.4,
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            child: svgAsset(
                              'lib/assets/close_icon.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 10,
                      ),
                      child: w700_20(context, 'Network Providers', blackColor),
                    ),

                    // Container 1 - Naira
                    GestureDetector(
                      onTap: () {
                        // Update only the tapped container and reset the others
                        setState(() {
                          for (int i = 0; i < isCheckedList.length; i++) {
                            isCheckedList[i] = (i ==
                                0); // Only index 0 (first container) is true
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isCheckedList[0]
                              ? textfieldColor
                              : Colors.transparent,
                        ),
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    'lib/assets/mtn.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: w500_14(
                                                context, 'MTN', blackColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 24,
                              width: 24,
                              child: Checkbox.adaptive(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20), // Circular shape
                                ),
                                value: isCheckedList[0],
                                onChanged: (value) {
                                  setState(() {
                                    for (int i = 0;
                                        i < isCheckedList.length;
                                        i++) {
                                      isCheckedList[i] = (i ==
                                          0); // Only first checkbox gets checked
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Divider(color: textFieldBorderColor),

                    // Container 2 - USD
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          for (int i = 0; i < isCheckedList.length; i++) {
                            isCheckedList[i] =
                                (i == 1); // Only second container is true
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isCheckedList[1]
                              ? textfieldColor
                              : Colors.transparent,
                        ),
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    'lib/assets/glo.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child:
                                            w500_14(context, 'GLO', blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 24,
                              width: 24,
                              child: Checkbox.adaptive(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20), // Circular shape
                                ),
                                value: isCheckedList[1],
                                onChanged: (value) {
                                  setState(() {
                                    for (int i = 0;
                                        i < isCheckedList.length;
                                        i++) {
                                      isCheckedList[i] = (i ==
                                          1); // Only second checkbox gets checked
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Divider(color: textFieldBorderColor),

                    // Container 3 - GHS
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          for (int i = 0; i < isCheckedList.length; i++) {
                            isCheckedList[i] =
                                (i == 2); // Only third container is true
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isCheckedList[2]
                              ? textfieldColor
                              : Colors.transparent,
                        ),
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    'lib/assets/airtel.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: w500_14(
                                            context, 'Airtel', blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 24,
                              width: 24,
                              child: Checkbox.adaptive(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20), // Circular shape
                                ),
                                value: isCheckedList[2],
                                onChanged: (value) {
                                  setState(() {
                                    for (int i = 0;
                                        i < isCheckedList.length;
                                        i++) {
                                      isCheckedList[i] = (i ==
                                          2); // Only third checkbox gets checked
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: textFieldBorderColor),
                  ],
                ),
              );
            },
          );
        },
      );
    }

    void openAirtimeSheet() {
      showModalBottomSheet(
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        backgroundColor: whiteColor,
        context: context,
        builder: (context) {
          final screenSize = MediaQuery.of(context).size;
          return StatefulBuilder(
            // Use StatefulBuilder to manage the Checkbox state within the BottomSheet
            builder: (context, setState) {
              return Container(
                margin: EdgeInsets.all(20),
                // height: screenSize.height * 0.4,
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            child: svgAsset(
                              'lib/assets/close_icon.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 10,
                      ),
                      child: w700_20(context, 'Payment', blackColor),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color:
                                Color(0x40C4C4C4), // #C4C4C440 with 25% opacity
                            offset:
                                Offset(0, 4), // 0px on x-axis, 4px on y-axis
                            blurRadius: 8, // 8px blur radius
                            spreadRadius: 0, // 0px spread radius (optional)
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              w400_14(context, 'Description', blackColor),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: textfieldColor,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Image.asset(
                                        'lib/assets/mtn.png',

                                        // fit: BoxFit.contain,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: w400_14(
                                          context, 'Airtime', blackColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(color: textFieldBorderColor),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              w400_14(context, 'Amount', blackColor),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0.0),
                                      child: w400_14(
                                          context,
                                          '₦${_amountController.text}',
                                          blackColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(color: textFieldBorderColor),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              w400_14(context, 'Phone No', blackColor),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    w400_14(context, '+234', blackColor),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0.0),
                                      child: w400_14(
                                          context,
                                          '${_airtimeController.text}',
                                          blackColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(color: textFieldBorderColor),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _showBottomDialog(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: screenSize.height * 0.035,
                        ),
                        alignment: Alignment.center,
                        height: screenSize.height * 0.05,
                        width: screenSize.width,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                            child: w500_17(context, 'Confirm', whiteColor)),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: whiteColor,
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
                      Get.back();
                      // Get.back(id: NavIds.home);
                      // Get.offAllNamed('/bottomNav', arguments: 0);
                      // Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: w600_17(context, 'Airtime', blackColor),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: w600_17(context, 'History', blackColor),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 170),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey.shade300), // Border color
                    ),
                    child: TextField(
                      autofocus: false,
                      controller: _airtimeController,
                      keyboardType: TextInputType.number,
                      cursorColor: secondaryColor,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: GestureDetector(
                          onTap: () {
                            openBottomSheet();
                          },
                          child: Row(
                            mainAxisSize:
                                MainAxisSize.min, // Wrap content in Row
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'lib/assets/mtn.png',

                                    // fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      2), // Spacing between icon and dropdown
                              Icon(Icons.arrow_drop_down, color: Colors.grey),
                              SizedBox(width: 8),
                              // Vertical Divider
                              Container(
                                width: 1,
                                height: 30,
                                color: Colors.grey.shade300,
                              ),
                              SizedBox(width: 8),
                            ],
                          ),
                        ),
                        suffixIcon: Container(
                          margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        // Adding left margin to the text input
                        contentPadding: EdgeInsets.only(
                            left: 15, top: 15, bottom: 15), // Here
                      ),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 37.0, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w600_26(
                          context,
                          'Top up',
                          blackColor,
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of items per row
                      childAspectRatio: 1, // Adjust aspect ratio as needed
                      crossAxisSpacing: 10, // Spacing between items
                      mainAxisSpacing: 10, // Spacing between rows
                    ),
                    itemCount: 6, // Number of items
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _amountController.text = [
                              '50',
                              '100',
                              '200',
                              '500',
                              '1000',
                              '2000'
                            ][index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: textfieldColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  w600_15(context, '₦', blackColor),
                                  w600_15(
                                      context,
                                      [
                                        '50.00',
                                        '100.00',
                                        '200.00',
                                        '500.00',
                                        '1000.00',
                                        '2000.00'
                                      ][index],
                                      blackColor),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  w400_12(
                                      context,
                                      [
                                        '1.5 cashback',
                                        '3 cashback',
                                        '6 cashback',
                                        '1.5 cashback',
                                        '3 cashback',
                                        '6 cashback'
                                      ][index],
                                      blackColor),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 0, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w400_12(
                          context,
                          'Amount',
                          Color.fromRGBO(55, 55, 55, 0.5),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      // Border color
                    ),
                    child: TextFormField(
                      autofocus: false,
                      controller: _amountController,
                      validator: (value) =>
                          value!.isEmpty ? 'Amount is required' : null,
                      keyboardType: TextInputType.number,
                      cursorColor: secondaryColor,
                      decoration: InputDecoration(
                        labelStyle: buttonText04Style(cardRadialColor01),
                        floatingLabelBehavior: FloatingLabelBehavior.never,

                        filled: false,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: textFieldBorderColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: textFieldBorderColor),
                          borderRadius: BorderRadius.circular(5),
                        ),

                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: textFieldBorderColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Enter Amount'),
                          ],
                        ),

                        prefix: Padding(
                          padding: EdgeInsets.only(
                              right: 5), // Adjust spacing if needed
                          child: Text(
                            '₦',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),

                        // Adding left margin to the text input
                        contentPadding: EdgeInsets.only(
                            left: 15, top: 15, bottom: 15), // Here
                      ),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Container(
                      width: screenSize.width,
                      decoration: BoxDecoration(
                          color: textfieldColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          screenSize.width * 0.04,
                          screenSize.height * 0.02,
                          screenSize.width * 0.04,
                          screenSize.height * 0.02,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: textFieldBorderColor),
                              child: svgAssetCo(
                                'lib/assets/ngnnaira.svg',
                                ColorFilter.mode(primaryColor, BlendMode.srcIn),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: w600_15(
                                        context,
                                        'USSD enquiry',
                                        blackColor,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: w400_15(
                                        context,
                                        'Check phone balance and more',
                                        blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      openAirtimeSheet();
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: screenSize.height * 0.02,
                      ),
                      alignment: Alignment.center,
                      height: screenSize.height * 0.05,
                      width: screenSize.width,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                          child: w500_17(context, 'Confirm', whiteColor)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
