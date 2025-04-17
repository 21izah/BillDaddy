import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'bottomNavigation.dart';
import 'tvSub_verifying_screen.dart';

class TvSubScreen extends StatefulWidget {
  const TvSubScreen({super.key});

  @override
  State<TvSubScreen> createState() => _TvSubScreenState();
}

class _TvSubScreenState extends State<TvSubScreen> {
  final _smartCardNumber = TextEditingController();
  final _amountController = TextEditingController();
  final _searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int selectedIndex = 1;

  bool isChecked = false;
  bool passwordObscured = true;

  Color _containerColor = Colors.grey.shade200;
  Color _containerTextColor = Colors.grey;

  // State variables to hold the selected package name and price
  String selectedPackageName = 'Select package';
  String selectedPackagePrice = '';

  List<Map<String, dynamic>> tvSubCompanies = [
    {
      'name': 'Startimes',
      'imagePath': 'lib/assets/starTime.png',
    },
    {
      'name': 'StarTimes ON',
      'imagePath': 'lib/assets/starTimeOn.png',
    },
    {
      'name': 'DSTV',
      'imagePath': 'lib/assets/dstv.png',
    },
    {
      'name': 'GOTV',
      'imagePath': 'lib/assets/goTv.png',
    },
  ];
  List<Map<String, dynamic>> tvPackages = [
    {
      'name': 'DDT_Nova',
      "price": "₦ 1,500",
    },
    {
      'name': 'DDT_Basic',
      "price": "₦ 2,500",
    },
    {
      'name': 'DDT_Classic',
      "price": "₦ 4,500",
    },
    {
      'name': 'DDT_Chinese',
      "price": "₦ 14,500",
    },
    {
      'name': 'DDT_Smart',
      "price": "₦ 3,500",
    },
    {
      'name': 'DDT_Super',
      "price": "₦ 7,500",
    },
  ];

  List<bool> isCheckedList = [false, false, false, false, false, false];
  List<Map<String, dynamic>> _filteredCompanies = [];
  List<Map<String, dynamic>> _filteredPackages = [];

  @override
  void initState() {
    super.initState();
    // Add listeners to text controllers to call _updateButtonState whenever text changes
    _smartCardNumber.addListener(_updateButtonState);
    _amountController.addListener(_updateButtonState);
    _filteredCompanies = tvSubCompanies;
    _filteredPackages = tvPackages;
  }

  void runFilter(String enterKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty) {
      results = tvSubCompanies;
    } else {
      results = tvSubCompanies
          .where((user) =>
              user['name']!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredCompanies = results;
    });
  }

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

  @override
  void dispose() {
    _smartCardNumber.dispose();
    _amountController.dispose();
    _searchController.dispose();

    // Dispose text controller listeners to avoid memory leaks
    _smartCardNumber.removeListener(_updateButtonState);
    _amountController.removeListener(_updateButtonState);

    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      if (_smartCardNumber.text.trim().isNotEmpty &&
          !(selectedPackageName
              .contains('Select the package you would like to pay for'))) {
        _containerColor = secondaryColor;
        _containerTextColor = whiteColor;
      } else {
        _containerColor = Colors.grey.shade200;
        _containerTextColor = Colors.grey;
      }
    });
  }

  void openBottomSheet() {
    showModalBottomSheet(
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
                  buildTitle(),
                  Container(
                    height: screenSize.height * 0.4,
                    width: screenSize.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _filteredCompanies.length,
                      itemBuilder: (context, index) {
                        final company = _filteredCompanies[index];
                        return Column(
                          children: [
                            buildTvSubContainer(
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

  // Method to build the header
  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 40,
          child: svgAsset(
            'lib/assets/close_icon.svg',
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

  // Method to build each currency container
  Widget buildTvSubContainer({
    required int index,
    required String imagePath,
    required String currencyName,
    required String currencyCode,
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

  void _navigateToVerifyingScreen() {
    if (_formKey.currentState?.validate() == true && isChecked) {
      // Navigator.of(context).push(
      //   PageTransition(
      //     child: OtpScreen(),
      //     type: PageTransitionType.leftToRight
      //     duration: Duration(seconds: 1),
      //   ),
      // );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all fields and accept the terms."),
        ),
      );
    }
  }

  void openTvSubDetailsSheet() {
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
                                  '#ffwf',
                                  blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Provider', blackColor),
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
                                        w400_14(context, 'IBEDC', blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Smartcard Number', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: w400_14(context,
                                        '${_smartCardNumber.text}', blackColor),
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
                            w400_14(context, 'Subscription Period', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: w400_14(context, 'grgg', blackColor),
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

  void _validateAndOpenBottomSheet() {
    if (_formKey.currentState?.validate() ?? false) {
      //  Function() navigateToNextPage,
      // Form is valid, proceed with submission
      openTvSubDetailsSheet();
    }
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
                              child: TvsubVerifyingScreen(),
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

// ffwrwv

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
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
                    child: w600_17(context, 'TV', blackColor),
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
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      w400_14(context, 'Service Provider', blackColor),
                    ],
                  ),
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
                                    'lib/assets/starTime.png',
                                    fit: BoxFit.contain,
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
                                        margin: EdgeInsets.only(),
                                        child: w600_17(
                                            context, 'StarTimes', blackColor),
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
                    padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        w400_14(
                          context,
                          'Smartcard Number',
                          blackColor,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   PageTransition(
                            //       child: ElectricityBeneficiaryScreen(),
                            //       type: PageTransitionType.leftToRight
                            //       duration: Duration(seconds: 1)),
                            // );
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 0.0),
                                child: w400_14(
                                  context,
                                  'Beneficiaries',
                                  blackColor,
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                child: svgAsset(
                                  'lib/assets/vright_arrow.svg',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // padding: const EdgeInsets.all(1.0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 30),
                    child: TextFormField(
                      style: TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      cursorColor: secondaryColor,
                      keyboardType: TextInputType.number,
                      controller: _smartCardNumber,
                      validator: (value) => value!.isEmpty
                          ? 'SmartCard Number is required'
                          : null,
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
                            Text('Enter Number'),
                          ],
                        ),

                        labelStyle: buttonText04Style(
                          Color.fromRGBO(51, 51, 51, 0.2),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,

                        filled: true,
                        fillColor: Color.fromRGBO(217, 217, 217, 0.25),
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
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w400_14(
                          context,
                          'Subscription Period',
                          blackColor,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Container(
                            height: 52,
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(5, 71, 138, 0.1),
                            ),
                            child: Center(
                              child: Text('7 Days'),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            height: 52,
                            margin: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(245, 245, 245, 1),
                            ),
                            child: Center(
                              child: Text('30 Days'),
                            ),
                          ),
                        ),
                      ],
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
                                      buildPackageTitle(),
                                      Container(
                                        height: screenSize.height * 0.4,
                                        width: screenSize.width,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
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
                                                        i <
                                                            isCheckedList
                                                                .length;
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
                                                        BorderRadius.circular(
                                                            10),
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
                                                            child: Checkbox
                                                                .adaptive(
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
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  for (int i =
                                                                          0;
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
                                                      company['name']!,
                                                  currencyCode:
                                                      company['price']!,
                                                  screenSize: screenSize,
                                                  setState: setState,
                                                ),
                                                Divider(
                                                    color:
                                                        textFieldBorderColor),
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, bottom: 5, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        w400_14(
                          context,
                          'Save Beneficiary',
                          blackColor,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   PageTransition(
                            //       child: ElectricityBeneficiaryScreen(),
                            //       type: PageTransitionType.leftToRight
                            //       duration: Duration(seconds: 1)),
                            // );
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 24,
                                width: 24,
                                child: Transform.scale(
                                  scale:
                                      0.7, // Adjust the scale factor to control the size
                                  child: SizedBox(
                                    child: Switch.adaptive(
                                      activeColor: secondaryColor,
                                      value: isChecked,
                                      onChanged: (value) =>
                                          setState(() => isChecked = value),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildSignInButton(screenSize),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
