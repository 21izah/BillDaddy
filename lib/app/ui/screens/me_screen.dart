import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/constants/data_constant.dart';
import 'account_limit_screen.dart';
import 'kyc_screen.dart';
import 'refer_and_earn_screen.dart';
import 'starPainter.dart';

import 'package:clipboard/clipboard.dart';

class MeScreen extends StatefulWidget {
  const MeScreen({super.key});

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen>
    with SingleTickerProviderStateMixin {
  bool passwordObscured = true; // Default state
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    loadObscuredState();
    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    // Define the slide transition animation
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0), // Start above the screen
      end: Offset.zero, // Slide into position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller
    super.dispose();
  }

  // Load the obscured state from Hive
  void loadObscuredState() async {
    final box = GetStorage();

    setState(() {
      passwordObscured = box.read(
        'is_Obscure',
      ); // Load the saved value
    });
  }

  // Toggle the obscured state and save it to Hive
  void obscure() async {
    final box = GetStorage();

    setState(() {
      passwordObscured = !passwordObscured;
      box.write('is_Obscure', passwordObscured); // Save the value in Hive
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    void _showCustomSnackbar(BuildContext context) {
      FlutterClipboard.copy('2083912405');
      // Show the overlay
      _controller.forward(); // Start the slide animation

      final overlay = OverlayEntry(
        builder: (context) => Positioned(
          top: 0, // Position at the top of the screen
          left: 0,
          right: 0,
          child: SlideTransition(
            position: _offsetAnimation, // Use the slide transition
            child: Container(
              height: screenSize.height * 0.12,
              width:
                  MediaQuery.of(context).size.width, // Full width of the screen
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 19, 224, 125),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Account number copied',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Insert the overlay into the screen
      Overlay.of(context).insert(overlay);

      // Automatically remove the overlay after 3 seconds
      Future.delayed(Duration(seconds: 3), () {
        overlay.remove(); // Remove the overlay
        _controller.reset(); // Reset the animation controller
      });
    }

    return Scaffold(
      // backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
      backgroundColor: Color.fromRGBO(206, 47, 47, 0.949),
      body: Stack(
        children: [
          Container(
            height: screenSize.height,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: w700_18(context, 'Hi, ', whiteColor),
                                ),
                                w700_18(
                                    context, 'Bola'.toUpperCase(), whiteColor),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 16.71,
                                    width: 20,
                                    child: svgAsset('lib/assets/diamond.svg'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child:
                                        w500_16(context, 'Rewards', blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            w400_14(context, 'Total Balance', whiteColor),
                            SizedBox(height: 4),
                            GestureDetector(
                              onTap: obscure,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    passwordObscured
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: whiteColor,
                                    size: screenSize.height * 0.02,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                    width:
                                        8), // Add some spacing between the icon and text
                                Container(
                                  width: screenSize.width *
                                      0.5, // Fixed width for consistency
                                  alignment: Alignment.centerRight,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: passwordObscured
                                        ? w500_17(context,
                                            '₦ 31,000,000,000.00', whiteColor)
                                        : w700_18(context, '****', whiteColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: whiteColor, width: 3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(color: primaryColor, width: 2),
                                color: whiteColor,
                              ),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: secondaryColor,
                                ),
                                child: Icon(Icons.person, color: whiteColor),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    w400_14(context, 'Account No', whiteColor),
                                    SizedBox(width: 8),
                                    Flexible(
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: whiteColor),
                                        ),
                                        child: w400_14(
                                          context,
                                          '0467895675',
                                          whiteColor,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _showCustomSnackbar(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.copy,
                                          color: whiteColor,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            // top: screenSize.height * 0.26,
            top: 200,
            left: 0, // Align it from the left
            right: 0, // Align it from the right to fill width
            child: Container(
              height: screenSize.height,
              width:
                  screenSize.width, // Set width or align using left and right
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: textfieldColor,
              ),
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 150),
                child: ListView(
                  children: [
                    // fgggg
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/me/TransactionHistoryScreen');
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0,
                                                  0.08), // Set the shadow color
                                              offset: Offset(0,
                                                  4), // Horizontal and vertical offset
                                              blurRadius:
                                                  4, // How much the shadow should be blurred
                                            ),
                                          ],
                                          color:
                                              Color.fromRGBO(220, 229, 239, 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: svgAsset(
                                          'lib/assets/transactionHis.svg',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(),
                                              child: w500_17(
                                                  context,
                                                  'Transaction History',
                                                  blackColor),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: w400_11(
                                                  'Your recent transaction history.',
                                                  blackColor),
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
                              Get.toNamed('/me/AddPaymentOptionScreen');
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0,
                                                  0.08), // Set the shadow color
                                              offset: Offset(0,
                                                  4), // Horizontal and vertical offset
                                              blurRadius:
                                                  4, // How much the shadow should be blurred
                                            ),
                                          ],
                                          color:
                                              Color.fromRGBO(220, 229, 239, 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: svgAsset(
                                          'lib/assets/payOption.svg',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(),
                                              child: w500_17(context,
                                                  'Payment Option', blackColor),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: w400_11(
                                                  'Add payment option',
                                                  blackColor),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AccountLimitScreen(),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0,
                                                  0.08), // Set the shadow color
                                              offset: Offset(0,
                                                  4), // Horizontal and vertical offset
                                              blurRadius:
                                                  4, // How much the shadow should be blurred
                                            ),
                                          ],
                                          color:
                                              Color.fromRGBO(220, 229, 239, 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: svgAsset(
                                          'lib/assets/accountLimit.svg',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(),
                                              child: w500_17(context,
                                                  'Account Limits', blackColor),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: w400_11(
                                                  'Verify your transaction limits',
                                                  blackColor),
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
                              Get.toNamed('/me/PayidScreen');
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0,
                                                  0.08), // Set the shadow color
                                              offset: Offset(0,
                                                  4), // Horizontal and vertical offset
                                              blurRadius:
                                                  4, // How much the shadow should be blurred
                                            ),
                                          ],
                                          color:
                                              Color.fromRGBO(220, 229, 239, 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: svgAsset(
                                          'lib/assets/payId.svg',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(),
                                              child: w500_17(context, 'Pay ID',
                                                  blackColor),
                                            ),
                                            Container(
                                              width: screenSize.width * 0.45,
                                              margin: EdgeInsets.only(top: 5),
                                              child: Expanded(
                                                child: w400_11(
                                                    'Generate unique code for online transactions.',
                                                    blackColor),
                                              ),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => KycScreen(),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0,
                                                  0.08), // Set the shadow color
                                              offset: Offset(0,
                                                  4), // Horizontal and vertical offset
                                              blurRadius:
                                                  4, // How much the shadow should be blurred
                                            ),
                                          ],
                                          color:
                                              Color.fromRGBO(220, 229, 239, 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: svgAsset(
                                          'lib/assets/KYC.svg',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(),
                                              child: w500_17(context,
                                                  'Complete KYC', blackColor),
                                            ),
                                            Container(
                                              width: screenSize.width * 0.45,
                                              margin: EdgeInsets.only(top: 5),
                                              child: Expanded(
                                                child: w400_11(
                                                    'Verify your account using your BVN or NIN',
                                                    blackColor),
                                              ),
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
                        ],
                      ),
                    ),
                    // sevve
                    Container(
                      margin: EdgeInsets.only(
                          top: 20, bottom: screenSize.height * 0.02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/me/ussd');
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0,
                                                  0.08), // Set the shadow color
                                              offset: Offset(0,
                                                  4), // Horizontal and vertical offset
                                              blurRadius:
                                                  4, // How much the shadow should be blurred
                                            ),
                                          ],
                                          color:
                                              Color.fromRGBO(220, 229, 239, 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: svgAsset(
                                          'lib/assets/EgoUssd.svg',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(),
                                              child: w500_17(
                                                  context,
                                                  'EgoFinance USSD',
                                                  blackColor),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child:
                                                  w400_11('*427#', blackColor),
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
                              Get.toNamed('/me/support');
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0,
                                                  0.08), // Set the shadow color
                                              offset: Offset(0,
                                                  4), // Horizontal and vertical offset
                                              blurRadius:
                                                  4, // How much the shadow should be blurred
                                            ),
                                          ],
                                          color:
                                              Color.fromRGBO(220, 229, 239, 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: svgAsset(
                                          'lib/assets/support01.svg',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(),
                                              child: w500_17(context, 'Support',
                                                  blackColor),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReferAndEarnScreen(),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0,
                                                  0.08), // Set the shadow color
                                              offset: Offset(0,
                                                  4), // Horizontal and vertical offset
                                              blurRadius:
                                                  4, // How much the shadow should be blurred
                                            ),
                                          ],
                                          color:
                                              Color.fromRGBO(220, 229, 239, 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: svgAsset(
                                          'lib/assets/referral.svg',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(),
                                              child: w500_17(
                                                  context,
                                                  'Refer your friends',
                                                  blackColor),
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
                              Get.toNamed('/me/settings');
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(10),
                                        child: svgAsset(
                                          'lib/assets/settings.svg',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(),
                                              child: w500_17(context,
                                                  'Settings', blackColor),
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
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: screenSize.height * 0.25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8),
                            child: w400_11('Rate Us:', blackColor),
                          ),
                          CustomPaint(
                            size: Size(15, 15), // Set the size of the canvas
                            painter: StarPainter(secondaryColor),
                          ),
                          CustomPaint(
                            size: Size(15, 15), // Set the size of the canvas
                            painter: StarPainter(secondaryColor),
                          ),
                          CustomPaint(
                            size: Size(15, 15), // Set the size of the canvas
                            painter: StarPainter(star2),
                          ),
                          CustomPaint(
                            size: Size(15, 15), // Set the size of the canvas
                            painter: StarPainter(star2),
                          ),
                          CustomPaint(
                            size: Size(15, 15), // Set the size of the canvas
                            painter: StarPainter(star2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
