import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'bottomNavigation.dart';
import 'data_successful_screen.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  bool isChecked = false;
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

  // Dummy data list
  final List<Map<String, dynamic>> dataPlans = [
    {
      "size": "100MB",
      "duration": "1 Day",
      "price": "₦ 100.00",
      "cashback": "₦ 3 cashback"
    },
    {
      "size": "200MB",
      "duration": "3 Day",
      "price": "₦ 200.00",
      "cashback": "₦ 6 cashback"
    },
    {
      "size": "1GB",
      "duration": "1 Day",
      "price": "₦ 300.00",
      "cashback": "₦ 9 cashback"
    },
    {
      "size": "2.5GB",
      "duration": "2 Days",
      "price": "₦ 500.00",
      "cashback": "₦ 100 cashback"
    },
    {
      "size": "1GB",
      "duration": "7 Days",
      "price": "₦ 500.00",
      "cashback": "₦ 100 cashback"
    },
    {
      "size": "1.5GB",
      "duration": "30 Days",
      "price": "₦ 1000.00",
      "cashback": "₦ 100 cashback"
    },
    {
      "size": "7GB",
      "duration": "7 Days",
      "price": "₦ 2000.00",
      "cashback": "₦ 60 cashback"
    },
    {
      "size": "5GB",
      "duration": "7 Days",
      "price": "₦ 1,500.00",
      "cashback": "₦ 45 cashback"
    },
    {
      "size": "3GB",
      "duration": "7 Days",
      "price": "₦ 1,600.00",
      "cashback": "₦ 47 cashback"
    },
    {
      "size": "3.5GB",
      "duration": "30 Days",
      "price": "₦ 5,500.00",
      "cashback": "₦ 60 cashback"
    },
    {
      "size": "10GB",
      "duration": "30 Days",
      "price": "₦ 5,500.00",
      "cashback": "₦ 60 cashback"
    },
    {
      "size": "14GB",
      "duration": "30 Days",
      "price": "₦ 5,500.00",
      "cashback": "₦ 60 cashback"
    },
  ];
  final List<String> categories = [
    "Hot",
    "Daily",
    "Weekly",
    "Monthly",
    "2-Months",
    "3-Months"
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    void openBottomSheet() {
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          leadingWidth: screenSize.width * 0.5,
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
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: w600_20(context, 'Mobile Data', blackColor),
                  ),
                ],
              ),
            ),
          ),
          // actions: [
          //   GestureDetector(
          //     onTap: () {},
          //     child: Padding(
          //       padding: const EdgeInsets.only(right: 20.0),
          //       child:  w400_16(
          // context,'History', blackColor),
          //     ),
          //   )
          // ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: screenSize.height,
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 00),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      // Border color
                    ),
                    child: TextField(
                      autofocus: false,
                      controller: _airtimeController,
                      keyboardType: TextInputType.number,
                      cursorColor: secondaryColor,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(217, 217, 217, 0.25),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(217, 217, 217, 0.25),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),

                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(217, 217, 217, 0.25),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Enter Phone Number'),
                          ],
                        ),
                        labelStyle: buttonText04Style(cardRadialColor01),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        // border: InputBorder.none,
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
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: SizedBox(
                      height:
                          40, // Set the height to control the size of the items
                      child: ListView.builder(
                        scrollDirection:
                            Axis.horizontal, // Make the ListView horizontal
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: index == 0
                                    ? secondaryColor
                                    : Colors
                                        .transparent, // Highlight the first item
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: index == 0
                                      ? secondaryColor
                                      : Colors.transparent, // Border color
                                ),
                              ),
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Center(
                                child: w400_12(
                                  context,
                                  categories[index],
                                  index == 0 ? whiteColor : blackColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      height: 507,
                      child: GridView.builder(
                        itemCount: dataPlans.length,
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) {
                          final item = dataPlans[index];
                          return GestureDetector(
                            onTap: () {
                              void _showBottomDialog(BuildContext context) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    final screenSize =
                                        MediaQuery.of(context).size;
                                    return Align(
                                      alignment: Alignment
                                          .bottomCenter, // Align at the bottom
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            0.0), // Optional padding
                                        child: Material(
                                          color: Colors
                                              .transparent, // Make the background transparent
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(10, 0,
                                                10, screenSize.height * 0.02),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width, // Full width
                                            padding: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // Rounded corners
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  blurRadius: 10,
                                                  offset: Offset(0, -5),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize
                                                  .min, // Take up minimum vertical space
                                              children: [
                                                w700_16(
                                                    context,
                                                    'Biometric authentication required',
                                                    blackColor),
                                                SizedBox(
                                                    height: screenSize.height *
                                                        0.01),
                                                w400_14_02(
                                                  context,
                                                  'Verify Identity',
                                                  Color.fromRGBO(
                                                      143, 154, 160, 1),
                                                ),
                                                SizedBox(
                                                    height: screenSize.height *
                                                        0.02),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      PageTransition(
                                                          child:
                                                              DataSuccessfulScreen(
                                                            amount:
                                                                item['price'],
                                                          ),
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              seconds: 1)),
                                                    );
                                                  },
                                                  child: Container(
                                                    // color: secondaryColor,
                                                    height: screenSize.height *
                                                        0.06,
                                                    width:
                                                        screenSize.width * 0.2,
                                                    child: svgAsset(
                                                      'lib/assets/fingerPrint.svg',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: screenSize.height *
                                                        0.01),
                                                w400_14_02(
                                                  context,
                                                  'Scan Fingerprint to authenticate',
                                                  Color.fromRGBO(
                                                      143, 154, 160, 1),
                                                ),
                                                // w700_17(
                                                //   context,
                                                //   'Scan Fingerprint to authenticate',
                                                //   Color.fromRGBO(
                                                //       143, 154, 160, 1),
                                                // ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Close the dialog
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

                              void openDataSheet() {
                                showModalBottomSheet(
                                  enableDrag: false,
                                  isDismissible: false,
                                  isScrollControlled: true,
                                  backgroundColor: whiteColor,
                                  context: context,
                                  builder: (context) {
                                    final screenSize =
                                        MediaQuery.of(context).size;
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
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
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: whiteColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(
                                                          0x40C4C4C4), // #C4C4C440 with 25% opacity
                                                      offset: Offset(0,
                                                          4), // 0px on x-axis, 4px on y-axis
                                                      blurRadius:
                                                          8, // 8px blur radius
                                                      spreadRadius:
                                                          0, // 0px spread radius (optional)
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: screenSize
                                                                  .height *
                                                              0.03,
                                                          bottom: screenSize
                                                                  .height *
                                                              0.02),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            child: w500_24_r(
                                                              context,
                                                              '${item['price']}',
                                                              blackColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        w400_14(
                                                            context,
                                                            'Product Name',
                                                            blackColor),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                height: 20,
                                                                width: 20,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100),
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  'lib/assets/PhElec.png',

                                                                  // fit: BoxFit.contain,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            8.0),
                                                                child: w400_14(
                                                                    context,
                                                                    'Mobile Data',
                                                                    blackColor),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        w400_14(
                                                            context,
                                                            'Amount',
                                                            blackColor),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            2.0),
                                                                child: w400_14(
                                                                    context,
                                                                    '${item['price']}',
                                                                    blackColor),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        w400_14(
                                                            context,
                                                            'Bonus',
                                                            blackColor),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                height: 20,
                                                                width: 20,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100),
                                                                ),
                                                                child:
                                                                    svgAssetCo(
                                                                  'lib/assets/ngnnaira.svg',
                                                                  ColorFilter.mode(
                                                                      secondaryColor,
                                                                      BlendMode
                                                                          .srcIn),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            2.0),
                                                                child: w400_14(
                                                                    context,
                                                                    '60 cashback',
                                                                    secondaryColor),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        w400_14(
                                                            context,
                                                            'Cashback (₦ 17.00)',
                                                            blackColor),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          child: Row(
                                                            children: [
                                                              w400_14(
                                                                  context,
                                                                  '-₦ 17.00',
                                                                  blackColor),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            20.0),
                                                                child: Transform
                                                                    .scale(
                                                                  scale: 0.7,
                                                                  child:
                                                                      Container(
                                                                    height: 24,
                                                                    width: 24,
                                                                    child: Switch
                                                                        .adaptive(
                                                                      activeColor:
                                                                          secondaryColor,
                                                                      value:
                                                                          isChecked,
                                                                      onChanged:
                                                                          (value) =>
                                                                              setState(() => isChecked = value ?? false),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenSize.height *
                                                        0.03,
                                                    bottom: screenSize.height *
                                                        0.01),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    w400_14(
                                                        context,
                                                        'Payment method',
                                                        blackColor),
                                                  ],
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          217, 217, 217, 0.25),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            height: 40,
                                                            width: 40,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: svgAsset(
                                                              'lib/assets/card23.svg',
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 15.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .only(),
                                                                      child: w400_14(
                                                                          context,
                                                                          'Balance ',
                                                                          blackColor),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .only(),
                                                                      child: w400_14(
                                                                          context,
                                                                          '(₦ 31,345,00.00)',
                                                                          blackColor),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 22,
                                                        width: 22,
                                                        child: svgAsset(
                                                          'lib/assets/vright_arrow.svg',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  _showBottomDialog(context);
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                    top: screenSize.height *
                                                        0.03,
                                                    bottom: screenSize.height *
                                                        0.025,
                                                  ),
                                                  alignment: Alignment.center,
                                                  height:
                                                      screenSize.height * 0.05,
                                                  width: screenSize.width,
                                                  decoration: BoxDecoration(
                                                    color: secondaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                  ),
                                                  child: Center(
                                                      child: w500_17(context,
                                                          'Pay', whiteColor)),
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

                              openDataSheet();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: textfieldColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    w800_12(
                                      context,
                                      item['size'],
                                      blackColor,
                                    ),
                                    w500_12(
                                      context,
                                      item['duration'],
                                      blackColor,
                                    ),
                                    w500_12(
                                      context,
                                      item['price'],
                                      blackColor,
                                    ),
                                    w500_10(
                                      context,
                                      item['cashback'],
                                      secondaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.05),
                    width: double
                        .infinity, // Ensures it takes full width without overflow
                    decoration: BoxDecoration(
                      color: textfieldColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text properly
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: w600_17(
                            context,
                            'Mobile Data Service',
                            blackColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              // Prevents overflow
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    height: MediaQuery.of(context).size.width *
                                        0.09,
                                    width: MediaQuery.of(context).size.width *
                                        0.09,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: textFieldBorderColor,
                                    ),
                                    child: svgAssetCo(
                                      'lib/assets/ngnnaira.svg',
                                      ColorFilter.mode(
                                          primaryColor, BlendMode.srcIn),
                                    ),
                                  ),
                                  SizedBox(width: 8), // Responsive spacing
                                  Expanded(
                                    // Wraps text to avoid overflow
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        w600_17(
                                          context,
                                          'USSD enquiry',
                                          blackColor,
                                        ),
                                        w400_16(
                                          context,
                                          'Check phone balance and more',
                                          blackColor,
                                          // overflow: TextOverflow.ellipsis, // Prevents text overflow
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: blackColor,
                              size: MediaQuery.of(context).size.width *
                                  0.05, // Adjust icon size dynamically
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.015,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: SweepGradient(
                          startAngle: -22.51 / 180 * 3.14,
                          colors: [
                            Color.fromRGBO(19, 79, 151, 1),
                            Color.fromRGBO(10, 44, 71, 1),
                            Color.fromRGBO(19, 79, 151, 1),
                            Color.fromRGBO(10, 44, 71, 1),
                          ],
                          stops: [0.35, 0.36, 1.99, 2.0],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: w600_17(
                                  context,
                                  'Buy data fast & easy with *855#',
                                  whiteColor,
                                ),
                              ),
                            ),
                            Icon(Icons.call, color: whiteColor),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SizedBox(
                    height: 150,
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
