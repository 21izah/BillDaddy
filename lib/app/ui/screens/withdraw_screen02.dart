import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'withdraw_successful_screen.dart';

class WithdrawScreen02 extends StatefulWidget {
  const WithdrawScreen02({super.key});

  @override
  State<WithdrawScreen02> createState() => _WithdrawScreen02State();
}

class _WithdrawScreen02State extends State<WithdrawScreen02> {
  bool isChecked = false;
  final _airtimeController = TextEditingController();
  final _recipientAccountController = TextEditingController();
  final _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Color _containerColor = disbaledButton;
  Color _containerTextColor = whiteColor;
  // Create a list to track the checked state of each container
  List<bool> isCheckedList = [false, false, false]; // Assuming 3 containers
  @override
  void dispose() {
    _airtimeController.dispose();
    _recipientAccountController.dispose();
    _amountController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Add listeners to text controllers to call _updateButtonState whenever text changes
    _recipientAccountController.addListener(_updateButtonState);
    _amountController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      if (_recipientAccountController.text.trim().isNotEmpty &&
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
                              child: WithdrawSuccessfulScreen(),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                borderRadius:
                                    BorderRadius.circular(20), // Circular shape
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                borderRadius:
                                    BorderRadius.circular(20), // Circular shape
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                borderRadius:
                                    BorderRadius.circular(20), // Circular shape
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

  void openWithdrawDetaiSheet() {
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
                                  '₦ ${_amountController.text}',
                                  blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Receiver’s Name', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: w400_14(
                                        context, 'Akeem Bayode', blackColor),
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
                                    child: Transform.scale(
                                      scale: 0.7,
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
                        top: screenSize.height * 0.03,
                        bottom: screenSize.height * 0.01),
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

  void _validateAndOpenBottomSheet() {
    if (_formKey.currentState?.validate() ?? false) {
      // Form is valid, proceed with submission
      openWithdrawDetaiSheet();
    }
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
          title: w600_17(
            context,
            'Withdraw',
            blackColor,
          ),
          backgroundColor: whiteColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w500_14(
                          context,
                          'Recipient Account',
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
                      controller: _recipientAccountController,
                      validator: (value) => value!.isEmpty
                          ? 'Recipient Account is required'
                          : null,
                      decoration: InputDecoration(
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Phone No./EgoFinance Acct No./Name'),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w500_14(
                          context,
                          'Select Amount',
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
                              '100',
                              '500',
                              '1000',
                              '3000',
                              '5000',
                              '10000'
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
                                        '100',
                                        '500',
                                        '1000',
                                        '3000',
                                        '5000',
                                        '10000'
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
                    padding: const EdgeInsets.only(top: 30.0, bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w500_14(
                          context,
                          'Select Amount',
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
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('100.00-9,999.00'),
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
                  _buildSignInButton(screenSize),
                  // GestureDetector(
                  //   onTap: () {
                  //     openAirtimeSheet();
                  //   },
                  //   child: Container(
                  //     margin: EdgeInsets.only(
                  //       top: screenSize.height * 0.005,
                  //       bottom: screenSize.height * 0.02,
                  //     ),
                  //     alignment: Alignment.center,
                  //     height: 40,
                  //     width: screenSize.width,
                  //     decoration: BoxDecoration(
                  //       color: secondaryColor,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Center(child:  w500_17(
                  // context,'Next', whiteColor)),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton(Size screenSize) {
    return GestureDetector(
      onTap: _validateAndOpenBottomSheet,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.02,
          bottom: screenSize.height * 0.02,
        ),
        child: Container(
          height: screenSize.height * 0.06,
          width: screenSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _containerColor,
          ),
          child: Center(
            child: w500_17(context, 'Next', _containerTextColor),
          ),
        ),
      ),
    );
  }
}
