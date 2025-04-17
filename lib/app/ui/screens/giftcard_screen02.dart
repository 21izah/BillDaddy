import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'giftcard_screen03.dart';

class GiftcardScreen02 extends StatefulWidget {
  const GiftcardScreen02({super.key});

  @override
  State<GiftcardScreen02> createState() => _GiftcardScreen02State();
}

class _GiftcardScreen02State extends State<GiftcardScreen02> {
  bool isChecked = false;
  final _searchController = TextEditingController();

  // Dummy giftcard list
  final List<Map<String, dynamic>> giftcardPlans = [
    {
      "name": "Amazon UK",
      'imagePath': 'lib/assets/amazon01.png',
      'imagePath01': 'lib/assets/amazon03.png',
    },
    {
      "name": "Amazon US",
      'imagePath': 'lib/assets/amazon02.png',
      'imagePath01': 'lib/assets/amazon03.png',
    },
    {
      "name": "American Express",
      'imagePath': 'lib/assets/americanExpress.png',
      'imagePath01': 'lib/assets/amazon03.png',
    },
    {
      "name": "Apple iTunes",
      'imagePath': 'lib/assets/apple01.png',
      'imagePath01': 'lib/assets/amazon03.png',
    },
    {
      "name": "Best Buy",
      'imagePath': 'lib/assets/bestBuy.png',
      'imagePath01': 'lib/assets/amazon03.png',
    },
    {
      "name": "Ebay",
      'imagePath': 'lib/assets/ebay.png',
      'imagePath01': 'lib/assets/amazon03.png',
    },
    {
      "name": "Google Play",
      'imagePath': 'lib/assets/googleplay.png',
      'imagePath01': 'lib/assets/amazon03.png',
    },
    {
      "name": "Stream",
      'imagePath': 'lib/assets/stream.png',
      'imagePath01': 'lib/assets/amazon03.png',
    },
  ];
  List<bool> isCheckedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<Map<String, dynamic>> _filteredCompanies = [];
  @override
  void initState() {
    super.initState();
    // Add listeners to text controllers to call _updateButtonState whenever text changes

    _filteredCompanies = giftcardPlans;
  }

  void runFilter(String enterKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty) {
      results = giftcardPlans;
    } else {
      results = giftcardPlans
          .where((user) =>
              user['name']!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredCompanies = results;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
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
                        // Navigator.of(context).push(
                        //   PageTransition(
                        //     child: WithdrawcardSuccessfulScreen(),
                        //     type: PageTransitionType.leftToRight
                        //     duration: Duration(seconds: 1),
                        //   ),
                        // );
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

  void openDataSheet() {
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
                              // Container(
                              //   child:
                              //       headingText18(
                              //     '${item['price']}',
                              //     blackColor,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Product Name', blackColor),
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
                                    child: w400_14(
                                        context, 'Mobile Data', blackColor),
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
                                children: [],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Bonus', blackColor),
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
                                          secondaryColor, BlendMode.srcIn),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0),
                                    child: w400_14(
                                        context, '60 cashback', secondaryColor),
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
                                      child: Switch.adaptive(
                                        activeColor: secondaryColor,
                                        value: isChecked,
                                        onChanged: (value) => setState(
                                            () => isChecked = value ?? false),
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
                  Spacer(),
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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: background02,
        appBar: AppBar(
          centerTitle: true,
          title: w700_24(
            context,
            'Buy Giftcard',
            blackColor,
          ),
          backgroundColor: whiteColor,
        ),
        body: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                margin: EdgeInsets.all(20),
                height: screenSize.height,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      // padding: const EdgeInsets.all(1.0),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: TextFormField(
                        onChanged: (value) => runFilter(value),
                        style: TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        cursorColor: secondaryColor,
                        keyboardType: TextInputType.text,
                        controller: _searchController,
                        decoration: InputDecoration(
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: secondaryColor,
                              )
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
                              Text('Search Gift Card'),
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
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          w400_14(
                            context,
                            'Select your Gift Card Type',
                            blackColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.7,
                      child: GridView.builder(
                        itemCount: _filteredCompanies.length,
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) {
                          final item = _filteredCompanies[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  child: GiftcardScreen03(
                                    imagePath01: item['imagePath01'],
                                    name: item['name'],
                                  ),
                                  type: PageTransitionType.leftToRight,
                                  // duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: textFieldBorderColor),
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
                                    Container(
                                      child: Image.asset(
                                        item['imagePath'],
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    w500_14(
                                      context,
                                      item['name'],
                                      blackColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildInternetContainer({
    required int index,
    required String imagePath,
    required String currencyName,
    required Size screenSize,
    required StateSetter setState,
  }) {
    return GestureDetector(
      onTap: () {
        // setState(() {
        //   for (int i = 0; i < isCheckedList.length; i++) {
        //     isCheckedList[i] = (i == index);
        //   }
        // });
        // Navigator.of(context).push(
        //   PageTransition(
        //     child: GiftcardScreen03(),
        //     type: PageTransitionType.leftToRight
        //     duration: Duration(seconds: 1),
        //   ),
        // );
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              w400_14(
                                context,
                                currencyName,
                                blackColor,
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
