import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'fund_wallet_successful_screen.dart';

class FundUsdScreen extends StatefulWidget {
  const FundUsdScreen({super.key});

  @override
  State<FundUsdScreen> createState() => _FundUsdScreenState();
}

class _FundUsdScreenState extends State<FundUsdScreen> {
  final _amountController = TextEditingController();
  @override
  void dispose() {
    _amountController.dispose();

    super.dispose();
  }

  List<bool> isCheckedList = [false, false, false]; // Assuming 3 containers

  String _selectedCurrency = 'NGN';
  String _selectedImage = 'lib/assets/NigeriaCircular.png';

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
                  buildCurrencyContainer(
                    index: 0,
                    imagePath: 'lib/assets/NigeriaCircular.png',
                    currencyName: 'Naira',
                    currencyCode: 'NGN',
                    screenSize: screenSize,
                    setState: setState,
                  ),
                  Divider(color: textFieldBorderColor),
                  buildCurrencyContainer(
                    index: 1,
                    imagePath: 'lib/assets/uSa.png',
                    currencyName: 'USD',
                    currencyCode: 'USD',
                    screenSize: screenSize,
                    setState: setState,
                  ),
                  Divider(color: textFieldBorderColor),
                  buildCurrencyContainer(
                    index: 2,
                    imagePath: 'lib/assets/GHS.png',
                    currencyName: 'GHS',
                    currencyCode: 'GHS',
                    screenSize: screenSize,
                    setState: setState,
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

  // Method to build each currency container
  Widget buildCurrencyContainer({
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
          _selectedCurrency = currencyName;
          _selectedImage = imagePath;
        });
        // Also update the parent widget's state
        this.setState(() {});
        Navigator.of(context).pop();
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
                  height: 20,
                  width: 20,
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
      child: w700_20(context, 'Preferred Accounts', blackColor),
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
          centerTitle: false,
          title: w600_17(
            context,
            'Fund Card',
            blackColor,
          ),
          backgroundColor: whiteColor,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        w700_14(
                          context,
                          'Bola Thomas',
                          blackColor,
                        ),
                        w700_14(
                          context,
                          '**** **** **** 9781',
                          blackColor,
                        ),
                      ],
                    ),
                    Container(
                      child: Image.asset(
                        'lib/assets/fund_verve.png',
                        width: 30,
                      ),
                    ),
                    // Transform.scale(
                    //   scale: 0.3,
                    //   child: Container(
                    //     child: Image.asset('lib/assets/fund_verve.png'),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: w400_12_r(context, 'Amount', blackColor),
                  ),
                ],
              ),
              Container(
                child: TextFormField(
                  autofocus: false,
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  cursorColor: secondaryColor,
                  decoration: InputDecoration(
                    prefixIcon: GestureDetector(
                      onTap: () {
                        openBottomSheet();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // Wrap content in Row
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                _selectedImage,

                                // fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          w500_12(
                              context, _selectedCurrency, cardRadialColor01),
                          SizedBox(
                              width: 2), // Spacing between icon and dropdown
                          Icon(Icons.keyboard_arrow_down_outlined,
                              color: Colors.grey),
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
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Enter Amount'),
                      ],
                    ),
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
                    // Adding left margin to the text input
                    contentPadding:
                        EdgeInsets.only(left: 15, top: 15, bottom: 15), // Here
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: w400_12_r(
                        context, 'Minimum Deposit = ₦1,000.00', blackColor),
                  ),
                ],
              ),
              _buildSignInButton(screenSize),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton(Size screenSize) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageTransition(
            child: FundWalletSuccessfulScreen(),
            type: PageTransitionType.leftToRight,
            // duration: Duration(seconds: 1),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.05,
          bottom: screenSize.height * 0.02,
        ),
        child: Container(
          height: screenSize.height * 0.06,
          width: screenSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: secondaryColor,
          ),
          child: Center(
            child: w500_17(context, 'Fund Card', whiteColor),
          ),
        ),
      ),
    );
  }
}
