import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class SafeLockScreen extends StatefulWidget {
  const SafeLockScreen({super.key});

  @override
  State<SafeLockScreen> createState() => _SafeLockScreenState();
}

class _SafeLockScreenState extends State<SafeLockScreen> {
  final _amountController = TextEditingController();
  // State variables to hold the selected package name and price
  String selectedPackageName = 'Select a package';
  String selectedPackagePrice = '';

  List<bool> isCheckedList = [false, false, false, false, false, false];
  List<bool> isCheckedList01 = [
    false,
    false,
  ];
  List<Map<String, dynamic>> _filteredCompanies = [];
  List<Map<String, dynamic>> _filteredPackages = [];

  bool isEgoFinanceBalance = false;
  bool isBankAccountBalance = false;

  DateTime dateTime = DateTime.now();
  DateTime dateTime01 = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Add listeners to text controllers to call _updateButtonState whenever text changes

    _filteredPackages = tvPackages;
  }

  List<Map<String, dynamic>> tvPackages = [
    {
      'name': 'DDT_Nova',
      "price": "5%",
    },
    {
      'name': 'DDT_Basic',
      "price": "10%",
    },
    {
      'name': 'DDT_Classic',
      "price": "15%",
    },
    {
      'name': 'DDT_Chinese',
      "price": "20%",
    },
    {
      'name': 'DDT_Smart',
      "price": "30%",
    },
    {
      'name': 'DDT_Super',
      "price": "50%",
    },
  ];
  void runFilter01(String enterKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty) {
      results = tvPackages;
    } else {
      results = tvPackages
          .where((user) =>
              user['name']!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredPackages = results;
    });
  }

  // Method to build the title
  Widget buildPackageTitle() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10,
      ),
      child: w700_20(context, 'Select Package', blackColor),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                      Get.offAllNamed('/me/savingSetting');
                      // Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: w600_17(context, 'Safe Lock', blackColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    w400_16(
                      context,
                      'Amount',
                      blackColor,
                    ),
                  ],
                ),
                Container(
                  // padding: const EdgeInsets.all(1.0),
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: TextFormField(
                    style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    cursorColor: secondaryColor,
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                    decoration: InputDecoration(
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          svgAsset(
                            'lib/assets/tabler_currency-naira.svg',
                          ),
                        ],
                      ),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Enter Amount'),
                        ],
                      ),
                      labelStyle: buttonText04Style(cardRadialColor01),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: whiteColor,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    w400_16(
                      context,
                      'Duration',
                      blackColor,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    void openPackageBottomSheet() {
                      showModalBottomSheet(
                        enableDrag: false,
                        isDismissible: false,
                        isScrollControlled: true,
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        context: context,
                        builder: (context) {
                          final screenSize = MediaQuery.of(context).size;
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Container(
                                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                // height: screenSize.height * 0.9,
                                width: double.infinity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    buildPackageTitle(),
                                    Container(
                                      // height: screenSize.height * 0.6,
                                      width: screenSize.width,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        // physics: NeverScrollableScrollPhysics(),
                                        itemCount: _filteredPackages.length,
                                        itemBuilder: (context, index) {
                                          final company =
                                              _filteredPackages[index];
                                          // Method to build each currency container
                                          Widget buildPackagesContainer({
                                            required int index,
                                            required String currencyName,
                                            required String currencyCode,
                                            required Size screenSize,
                                            required StateSetter setState,
                                          }) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  // Update the selected package name and price
                                                  selectedPackageName =
                                                      company['name']!;
                                                  selectedPackagePrice =
                                                      company['price']!;
                                                  print(selectedPackageName);
                                                  print(selectedPackagePrice);
                                                });
                                                // Also update the parent widget's state
                                                this.setState(() {});

                                                setState(() {
                                                  for (int i = 0;
                                                      i < isCheckedList.length;
                                                      i++) {
                                                    isCheckedList[i] =
                                                        (i == index);
                                                  }
                                                });
                                                // Close the bottom sheet after selection
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: isCheckedList[index]
                                                      ? whiteColor
                                                      : Colors.transparent,
                                                ),
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                padding: EdgeInsets.all(10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
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
                                                                  w400_14(
                                                                    context,
                                                                    currencyName,
                                                                    blackColor,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        w400_14(
                                                          context,
                                                          currencyCode,
                                                          blackColor,
                                                        ),
                                                        SizedBox(width: 5),
                                                        Container(
                                                          height: 24,
                                                          width: 24,
                                                          child:
                                                              Checkbox.adaptive(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                            value:
                                                                isCheckedList[
                                                                    index],
                                                            onChanged: (value) {
                                                              setState(() {
                                                                for (int i = 0;
                                                                    i <
                                                                        isCheckedList
                                                                            .length;
                                                                    i++) {
                                                                  isCheckedList[
                                                                          i] =
                                                                      (i ==
                                                                          index);
                                                                }
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }

                                          return Column(
                                            children: [
                                              buildPackagesContainer(
                                                index: index,
                                                currencyName: company['name']!,
                                                currencyCode: company['price']!,
                                                screenSize: screenSize,
                                                setState: setState,
                                              ),
                                              Divider(
                                                  color: textFieldBorderColor),
                                            ],
                                          );
                                        },
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

                    openPackageBottomSheet();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    width: screenSize.width,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: secondaryColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // State variables to hold the selected package name and price

                        w400_14(
                          context,
                          selectedPackageName,
                          blackColor,
                        ),
                        Row(
                          children: [
                            w400_14(
                              context,
                              selectedPackagePrice,
                              blackColor,
                            ),
                            Icon(Icons.keyboard_arrow_down_sharp),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            w400_16(
                              context,
                              'Start Date',
                              blackColor,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            void _showBottomDialog(BuildContext context) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Align(
                                      alignment: Alignment
                                          .bottomCenter, // Align at the bottom
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            20.0), // Optional padding
                                        child: Material(
                                          color: Colors
                                              .transparent, // Make the background transparent
                                          child: Container(
                                            height: screenSize.height * 0.3,
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
                                            child: CupertinoDatePicker(
                                                backgroundColor: whiteColor,
                                                initialDateTime: dateTime,
                                                use24hFormat: true,
                                                mode: CupertinoDatePickerMode
                                                    .date,
                                                onDateTimeChanged:
                                                    (DateTime newTime) {
                                                  setState(() {
                                                    dateTime = newTime;
                                                  });
                                                }),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }

                            _showBottomDialog(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                            width: screenSize.width * 0.4,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: secondaryColor)),
                            child: w400_16(
                              context,
                              '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                              blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            w400_16(
                              context,
                              'End Date',
                              blackColor,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            void _showBottomDialog(BuildContext context) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Align(
                                      alignment: Alignment
                                          .bottomCenter, // Align at the bottom
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            20.0), // Optional padding
                                        child: Material(
                                          color: Colors
                                              .transparent, // Make the background transparent
                                          child: Container(
                                            height: screenSize.height * 0.3,
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
                                            child: CupertinoDatePicker(
                                                backgroundColor: whiteColor,
                                                initialDateTime: dateTime,
                                                use24hFormat: true,
                                                mode: CupertinoDatePickerMode
                                                    .date,
                                                onDateTimeChanged:
                                                    (DateTime newTime) {
                                                  setState(() {
                                                    dateTime = newTime;
                                                  });
                                                }),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }

                            _showBottomDialog(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                            width: screenSize.width * 0.4,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: secondaryColor)),
                            child: w400_16(
                              context,
                              '${dateTime01.day}/${dateTime01.month}/${dateTime01.year}',
                              blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x40C4C4C4), // #C4C4C440 with 25% opacity
                        offset: Offset(0, 4), // 0px on x-axis, 4px on y-axis
                        blurRadius: 8, // 8px blur radius
                        spreadRadius: 0, // 0px spread radius (optional)
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            w600_20(context, 'Make Payment From', blackColor),
                          ],
                        ),
                      ),
                      StatefulBuilder(
                        // Use StatefulBuilder to manage the Checkbox state within the BottomSheet
                        builder: (context, setState) {
                          return Container(
                            margin: EdgeInsets.all(0),
                            width: double.infinity,
                            child: Column(
                              children: [
                                // Container 1 - Ego Finance Balance
                                GestureDetector(
                                  onTap: () {
                                    // Update only the tapped container and reset the others
                                    setState(() {
                                      for (int i = 0;
                                          i < isCheckedList01.length;
                                          i++) {
                                        isCheckedList01[i] = (i ==
                                            0); // Only index 0 (first container) is true
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: isCheckedList01[0]
                                          ? textfieldColor
                                          : Colors.transparent,
                                    ),
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Image.asset(
                                                  'lib/assets/egoFiBalance.png',
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                              SizedBox(
                                                  width:
                                                      5), // Add spacing between the icon and text
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    w400_17(
                                                      context,
                                                      'Ego Finance Balance',
                                                      blackColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Transform.scale(
                                          scale: 1.2,
                                          child: Checkbox.adaptive(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // Circular shape
                                            ),
                                            value: isCheckedList01[0],
                                            onChanged: (value) {
                                              setState(() {
                                                for (int i = 0;
                                                    i < isCheckedList01.length;
                                                    i++) {
                                                  isCheckedList01[i] = (i ==
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

                                // Container 2 - Bank Account
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      for (int i = 0;
                                          i < isCheckedList01.length;
                                          i++) {
                                        isCheckedList01[i] = (i ==
                                            1); // Only second container is true
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: isCheckedList01[1]
                                          ? textfieldColor
                                          : Colors.transparent,
                                    ),
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: svgAsset(
                                                  'lib/assets/bankAccount01.svg',
                                                ),
                                              ),
                                              SizedBox(
                                                  width:
                                                      5), // Add spacing between the icon and text
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    w400_17(
                                                      context,
                                                      'Bank Account',
                                                      blackColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Transform.scale(
                                          scale: 1.2,
                                          child: Checkbox.adaptive(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // Circular shape
                                            ),
                                            value: isCheckedList01[1],
                                            onChanged: (value) {
                                              setState(() {
                                                for (int i = 0;
                                                    i < isCheckedList01.length;
                                                    i++) {
                                                  isCheckedList01[i] = (i ==
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
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/safeLock02');
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.015,
                      left: 0,
                      right: 0,
                      bottom: screenSize.height * 0.02,
                    ),
                    child: Container(
                      height: screenSize.height * 0.06,
                      width: screenSize.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: secondaryColor),
                      child: Center(
                          child: w500_17(context, 'SaveLock', whiteColor)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
