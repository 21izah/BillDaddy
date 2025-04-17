import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'bettingVerifying_screen.dart';
import 'bottomNavigation.dart';

class BettingScreen extends StatefulWidget {
  const BettingScreen({super.key});

  @override
  State<BettingScreen> createState() => _BettingScreenState();
}

class _BettingScreenState extends State<BettingScreen> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _userIdController = TextEditingController();
  Color _containerColor = disbaledButton;
  Color _containerTextColor = whiteColor;
  List<Map<String, dynamic>> electricityCompanies = [
    {
      'name': '1xBET',
      'imagePath': 'lib/assets/1xbet.png',
    },
    {
      'name': 'SportyBet',
      'imagePath': 'lib/assets/sportyBet.png',
    },
    {
      'name': 'EasyWin',
      'imagePath': 'lib/assets/easyWin.png',
    },
  ];
  List<bool> isCheckedList = [
    false,
    false,
    false,
  ];
  List<Map<String, dynamic>> _filteredCompanies = [];
  String selectedBetName = '1xBET';
  String selectedBetImage = 'lib/assets/1xbet.png';
  @override
  void initState() {
    super.initState();
    // Add listeners to text controllers to call _updateButtonState whenever text changes
    _userIdController.addListener(_updateButtonState);
    _amountController.addListener(_updateButtonState);

    _filteredCompanies = electricityCompanies;
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

  void runFilter(String enterKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty) {
      results = electricityCompanies;
    } else {
      results = electricityCompanies
          .where((user) =>
              user['name']!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredCompanies = results;
    });
  }

  // Method to build the header
  Widget buildHeader() {
    return Row(
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
    );
  }

  // Method to build the title
  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10,
      ),
      child: w700_20(context, 'Select Provider', blackColor),
    );
  }

  void _validateAndOpenBottomSheet() {
    if (_formKey.currentState?.validate() ?? false) {
      // Form is valid, proceed with submission
      openBettingDetailsSheet();
    }
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
                              child: BettingverifyingScreen(),
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

  void openBettingDetailsSheet() {
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
                              Color(0x40C4C4C4), // ₦ C4C4C440 with 25% opacity
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
                                  '₦ ${_amountController.text}.00',
                                  blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Betting Platform', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Image.asset(
                                      'lib/assets/PhElec.png',

                                      // fit: BoxFit.contain,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child:
                                        w400_14(context, '1xBET', blackColor),
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
                                        '${_userIdController.text}',
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
                                        '${_amountController.text}.00',
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
                              Container(
                                height: 40,
                                width: 40,
                                padding: EdgeInsets.all(10),
                                child: svgAsset(
                                  'lib/assets/card23.svg',
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
                        borderRadius: BorderRadius.circular(10),
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

// Method to build each currency container
  Widget buildElectricityContainer({
    required int index,
    required String imagePath,
    required String currencyName,
    required String currencyCode,
    required Size screenSize,
    required StateSetter setState,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          for (int i = 0; i < isCheckedList.length; i++) {
            isCheckedList[i] = (i == index);
            selectedBetName = currencyName;
            selectedBetImage = imagePath;
          }
        });
        // Also update the parent widget's state
        this.setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isCheckedList[index] ? textfieldColor : Colors.transparent,
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
                          w400_14(
                            context,
                            currencyName,
                            blackColor,
                          ),
                          SizedBox(width: 5),
                          w400_14(
                            context,
                            currencyCode,
                            cardRadialColor01,
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
                  borderRadius: BorderRadius.circular(20),
                ),
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
          ],
        ),
      ),
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
                  buildHeader(),
                  buildTitle(),
                  Container(
                    height: screenSize.height * 0.3,
                    width: screenSize.width,
                    child: ListView.builder(
                      itemCount: _filteredCompanies.length,
                      itemBuilder: (context, index) {
                        final company = _filteredCompanies[index];
                        return Column(
                          children: [
                            buildElectricityContainer(
                              index: index,
                              imagePath: company['imagePath']!,
                              currencyName: company['name']!,
                              currencyCode: '',
                              screenSize: screenSize,
                              setState: setState,
                            ),
                            Divider(color: textFieldBorderColor),
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

  Widget _buildSignInButton(Size screenSize) {
    return GestureDetector(
      onTap: _validateAndOpenBottomSheet,
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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          leadingWidth: 200,
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
                    child: w600_20(context, 'Betting', blackColor),
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
          //       child: buttonText06('History', blackColor),
          //     ),
          //   )
          // ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      openBottomSheet();
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset(
                                  selectedBetImage,
                                  fit: BoxFit.contain,
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
                                          child: w500_17(context,
                                              selectedBetName, blackColor),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(),
                                          child: w300_12(
                                              context,
                                              'Top your ${selectedBetName} account daily and get a',
                                              blackColor),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(),
                                          child: w300_12(
                                              context,
                                              'chance to win amazing prizes.',
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      w400_14(
                        context,
                        'User ID',
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
                          Text('Enter your 1xBet number'),
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
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      w400_14(
                        context,
                        'Select Amount',
                        blackColor,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _amountController.text = '100';
                                });
                              },
                              child: Container(
                                height: 120,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: textfieldColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        w600_15(context, '₦', blackColor),
                                        w600_15(context, '100', blackColor),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _amountController.text = '500';
                                });
                              },
                              child: Container(
                                height: 120,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: textfieldColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        w600_15(context, '₦', blackColor),
                                        w600_15(context, '500', blackColor),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _amountController.text = '1,000';
                                });
                              },
                              child: Container(
                                height: 120,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: textfieldColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        w600_15(context, '₦', blackColor),
                                        w600_15(context, '1,000', blackColor),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _amountController.text = '3,000';
                              });
                            },
                            child: Container(
                              height: 120,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: textfieldColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      w600_15(context, '₦', blackColor),
                                      w600_15(context, '3,000', blackColor),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _amountController.text = '5000';
                              });
                            },
                            child: Container(
                              height: 120,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: textfieldColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      w600_15(context, '₦', blackColor),
                                      w600_15(context, '5,000', blackColor),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _amountController.text = '10000';
                              });
                            },
                            child: Container(
                              height: 120,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: textfieldColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      w600_15(context, '₦', blackColor),
                                      w600_15(context, '10,000', blackColor),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min, // Wrap content in Row
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: w500_20(
                              context,
                              '₦ ',
                              blackColor,
                            ),
                          ),
                        ],
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
                _buildSignInButton(screenSize),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
