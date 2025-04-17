import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'internet_verifying_screen.dart';

class InternetService02Screen extends StatefulWidget {
  final String name;
  final String Subname;
  final String imagePath;
  const InternetService02Screen(
      {super.key,
      required this.name,
      required this.Subname,
      required this.imagePath});

  @override
  State<InternetService02Screen> createState() =>
      _InternetService02ScreenState();
}

class _InternetService02ScreenState extends State<InternetService02Screen> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  final _userIdController = TextEditingController();
  final _amountController = TextEditingController();
  Color _containerColor = disbaledButton;
  Color _containerTextColor = whiteColor;

  // State variables to hold the selected package name and price
  String selectedPackageName = 'Select package';
  String selectedPackagePrice = '';
  List<bool> isCheckedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<Map<String, dynamic>> internetPackagesPackages = [
    {
      'Amount': '25GB',
      'Duration': '30 days',
      "price": "₦ 100",
    },
    {
      'Amount': '15GB',
      'Duration': '30 days',
      "price": "₦ 1,500",
    },
    {
      'Amount': '35GB',
      'Duration': '30 days',
      "price": "₦ 2,500",
    },
    {
      'Amount': '45GB',
      'Duration': '30 days',
      "price": "₦ 3,500",
    },
    {
      'Amount': '55GB',
      'Duration': '30 days',
      "price": "₦ 4,500",
    },
    {
      'Amount': '65GB',
      'Duration': '30 days',
      "price": "₦ 5,500",
    },
    {
      'Amount': '12GB',
      'Duration': '30 days',
      "price": "₦ 6,500",
    },
    {
      'Amount': '45GB',
      'Duration': '30 days',
      "price": "₦ 7,500",
    },
    {
      'Amount': '78GB',
      'Duration': '30 days',
      "price": "₦ 8,500",
    },
    {
      'Amount': '90GB',
      'Duration': '30 days',
      "price": "₦ 9,500",
    },
  ];
  List<Map<String, dynamic>> _filteredPackages = [];
  @override
  void initState() {
    super.initState();
    // Add listeners to text controllers to call _updateButtonState whenever text changes
    _userIdController.addListener(_updateButtonState);
    _amountController.addListener(_updateButtonState);
    _filteredPackages = internetPackagesPackages;
  }

  void runFilter01(String enterKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty) {
      results = internetPackagesPackages;
    } else {
      results = internetPackagesPackages
          .where((user) =>
              user['name']!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredPackages = results;
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _userIdController.dispose();

    // Dispose text controller listeners to avoid memory leaks
    _userIdController.removeListener(_updateButtonState);
    _amountController.removeListener(_updateButtonState);

    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      if (_userIdController.text.trim().isNotEmpty &&
          _amountController.text.trim().isNotEmpty) {
        _containerColor = secondaryColor;
        _containerTextColor = whiteColor;
      } else {
        _containerColor = disbaledButton;
        _containerTextColor = whiteColor;
      }
    });
  }

  void _showBottomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final screenSize = MediaQuery.of(context).size;
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
                            child: InternetVerifyingScreen(),
                            type: PageTransitionType.leftToRight,
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

  void openInternetDetailsSheet() {
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
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color(0x40C4C4C4), // #C4C4C440 with 25% opacity
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
                          padding: EdgeInsets.only(
                              top: screenSize.height * 0.03,
                              bottom: screenSize.height * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: w500_24_r(
                                  context,
                                  '₦ 31,000,000.00',
                                  blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Internet Service', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  // Container(
                                  //   height: 20,
                                  //   width: 20,
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(100),
                                  //   ),
                                  //   child: Image.asset(
                                  //     'lib/assets/PhElec.png',

                                  //     // fit: BoxFit.contain,
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: w400_14_d(context,
                                        '9mobile Data_Bundle', blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'User ID', blackColor),
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
                                        '${_userIdController.text.trim()}',
                                        blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: svgAssetCo(
                                      'lib/assets/ngnnaira.svg',
                                      ColorFilter.mode(
                                          blackColor, BlendMode.srcIn),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0),
                                    child: w400_14(
                                        context,
                                        '${_amountController.text}',
                                        blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Cashback (₦ 17.00)', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  w400_14(context, '-₦ 17.00', blackColor),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Container(
                                      height: 24,
                                      width: 24,
                                      child: Transform.scale(
                                        scale:
                                            0.7, // Adjust the scale factor to control the size
                                        child: SizedBox(
                                          child: Switch.adaptive(
                                            activeColor: secondaryColor,
                                            value: isChecked,
                                            onChanged: (value) => setState(
                                                () => isChecked = value),
                                          ),
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
                    // todo
                    padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w400_14(context, 'Payment method', blackColor),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 0.25),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 40,
                                  child: svgAsset(
                                    'lib/assets/card23.svg',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(),
                                          child: w400_14(
                                              context, 'Balance ', blackColor),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(),
                                          child: w400_14(context,
                                              '(₦ 31,345,00.00)', blackColor),
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
                        top: screenSize.height * 0.03,
                        bottom: screenSize.height * 0.025,
                      ),
                      alignment: Alignment.center,
                      height: 40,
                      width: screenSize.width,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(child: w500_17(context, 'Pay', whiteColor)),
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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: background02,
        appBar: AppBar(
          centerTitle: false,
          title: w700_24(
            context,
            'Internet Services',
            blackColor,
          ),
          backgroundColor: whiteColor,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                buildInternetContainer(
                  imagePath: widget.imagePath,
                  currencyName: widget.name,
                  currencyCode: widget.Subname,
                  screenSize: screenSize,
                  setState: setState,
                ),
                Divider(color: textFieldBorderColor),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      w400_14(
                        context,
                        'Account ID / User ID',
                        blackColor,
                      ),
                    ],
                  ),
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
                    controller: _userIdController,
                    validator: (value) =>
                        value!.isEmpty ? 'User ID is required' : null,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(
                      //   left: 15,
                      //   top: 20,
                      //   right: 10,
                      //   bottom: 20,
                      // ),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Enter Account ID / User ID'),
                        ],
                      ),

                      labelStyle: buttonText04Style(cardRadialColor01),
                      floatingLabelBehavior: FloatingLabelBehavior.never,

                      filled: false,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(5),
                      ),

                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      w400_14(
                        context,
                        'Package',
                        blackColor,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    void openPackageBottomSheet() {
                      showModalBottomSheet(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        context: context,
                        builder: (context) {
                          final screenSize = MediaQuery.of(context).size;
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Container(
                                margin: EdgeInsets.all(20),
                                height: screenSize.height * 0.8,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    buildPackageTitle(),
                                    Container(
                                      height: screenSize.height * 0.3,
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
                                                      company['Amount']!;
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
                                                      ? textfieldColor
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
                                                                    company[
                                                                        'Amount']!,
                                                                    blackColor,
                                                                  ),
                                                                  w400_14(
                                                                    context,
                                                                    company[
                                                                        'Duration']!,
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
                                                currencyName:
                                                    company['Amount']!,
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
                      color: Color.fromRGBO(215, 215, 215, 0.25),
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      w400_14(
                        context,
                        'Amount',
                        blackColor,
                      ),
                    ],
                  ),
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
                    validator: (value) =>
                        value!.isEmpty ? 'Amount is required' : null,
                    decoration: InputDecoration(
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          svgAsset(
                            'lib/assets/tabler_currency-naira.svg',
                          ),
                        ],
                      ),

                      // contentPadding: EdgeInsets.only(
                      //   left: 15,
                      //   top: 20,
                      //   right: 10,
                      //   bottom: 20,
                      // ),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Enter Amount'),
                        ],
                      ),

                      labelStyle: buttonText04Style(cardRadialColor01),
                      floatingLabelBehavior: FloatingLabelBehavior.never,

                      filled: false,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(5),
                      ),

                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                _buildSignInButton(screenSize),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateAndOpenBottomSheet() {
    if (_formKey.currentState?.validate() ?? false) {
      //  Function() navigateToNextPage,
      // Form is valid, proceed with submission
      openInternetDetailsSheet();
    }
  }

  Widget _buildSignInButton(Size screenSize) {
    return GestureDetector(
      onTap: () {
        _validateAndOpenBottomSheet();
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.05,
          left: screenSize.width * 0.02,
          right: screenSize.width * 0.02,
          bottom: screenSize.height * 0.02,
        ),
        child: Container(
          height: screenSize.height * 0.06,
          width: screenSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: _containerColor,
          ),
          child: Center(
            child: w500_17(context, 'Confirm', _containerTextColor),
          ),
        ),
      ),
    );
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

  Widget buildInternetContainer({
    required String imagePath,
    required String currencyName,
    required String currencyCode,
    required Size screenSize,
    required StateSetter setState,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: textfieldColor,
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
                    imagePath,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              w400_14(
                                context,
                                currencyName,
                                blackColor,
                              ),
                              w400_14(
                                context,
                                currencyCode,
                                secondaryColor,
                              ),
                            ],
                          ),
                          SizedBox(width: 5),
                        ],
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
}
