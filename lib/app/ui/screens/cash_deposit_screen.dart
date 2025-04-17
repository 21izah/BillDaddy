import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'nearby_merchant_screen.dart';

class CashDepositScreen extends StatefulWidget {
  const CashDepositScreen({super.key});

  @override
  State<CashDepositScreen> createState() => _CashDepositScreenState();
}

class _CashDepositScreenState extends State<CashDepositScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    void _showCustomSnackbar(BuildContext context) {
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
      backgroundColor: background02,
      appBar: AppBar(
        centerTitle: false,
        title: w600_17(
          context,
          'Cash Deposit',
          blackColor,
        ),
        backgroundColor: whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
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
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,

                      //   PageTransition(
                      //     type: PageTransitionType.leftToRight
                      //     child: const ReportScamScreen(),
                      //     duration: Duration(seconds: 1),
                      //   ),
                      //   // );
                      // );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w400_12(
                                        context,
                                        'EgoFinance Account Number',
                                        blackColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(),
                                child: w600_17(
                                    context, '806 789 5678', blackColor),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _showCustomSnackbar(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromRGBO(4, 140, 252, 0.15)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: w400_13(
                                            context, 'Copy', secondaryColor),
                                      ),
                                      Transform.scale(
                                          scale: 0.7, child: Icon(Icons.copy))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(20),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: w400_13(
                            context, 'How to make a cash deposit', blackColor),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 20, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset(
                                  'lib/assets/cd_give_cash.png',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w500_14(
                                            context,
                                            'Give cash to the POS merchant',
                                            blackColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w400_13(
                                            context,
                                            'Give cash to the POS merchant in exchange for the funds to be transferred to your EgoFinance Account',
                                            blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(
                                'lib/assets/cd_confirm_receipt.png',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(),
                                      child: w500_14(
                                          context,
                                          'Confirm receipt of funds',
                                          blackColor),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(),
                                      child: w400_13(
                                          context,
                                          'Confirm your EgoFinance Account has been funded with the correct account.',
                                          blackColor),
                                    ),
                                  ],
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageTransition(
                            child: NearbyMerchantScreen(),
                            type: PageTransitionType.leftToRight
                            // duration: Duration(seconds: 1),
                            ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.08),
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                      ),
                                    ],
                                    color: Color.fromRGBO(220, 229, 239, 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: svgAsset(
                                    'lib/assets/cd_find_nearby.svg',
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: w500_14(
                                    context,
                                    'Find nearby EgoFinance merchants',
                                    blackColor,
                                  ),
                                ),
                              ],
                            ),
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
          ],
        ),
      ),
    );
  }
}
