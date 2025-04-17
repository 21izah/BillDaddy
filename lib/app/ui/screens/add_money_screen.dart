import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'bank_ussd_screen.dart';
import 'bottomNavigation.dart';
import 'cash_deposit_screen.dart';
import 'contactTab_screen.dart';
import 'scan_qrCode_screen.dart';
import 'top_up_screen.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({super.key});

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen>
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

  List<Map<String, dynamic>> bankDetails = [
    {
      'name': 'Access Bank',
      'imagePath': 'lib/assets/ab_access_bank.png',
    },
    {
      'name': 'Eco Bank',
      'imagePath': 'lib/assets/ab_ecobank.png',
    },
    {
      'name': 'FCMB',
      'imagePath': 'lib/assets/ab_fcmb.png',
    },
    {
      'name': 'Fidelity Bank',
      'imagePath': 'lib/assets/ab_fidelity.png',
    },
    {
      'name': 'First Bank',
      'imagePath': 'lib/assets/ab_firstbank.png',
    },
    {
      'name': 'GT Bank',
      'imagePath': 'lib/assets/ab_gtbank.png',
    },
    {
      'name': 'Access Bank',
      'imagePath': 'lib/assets/ab_access_bank.png',
    },
    {
      'name': 'Eco Bank',
      'imagePath': 'lib/assets/ab_ecobank.png',
    },
    {
      'name': 'FCMB',
      'imagePath': 'lib/assets/ab_fcmb.png',
    },
    {
      'name': 'Fidelity Bank',
      'imagePath': 'lib/assets/ab_fidelity.png',
    },
    {
      'name': 'First Bank',
      'imagePath': 'lib/assets/ab_firstbank.png',
    },
    {
      'name': 'GT Bank',
      'imagePath': 'lib/assets/ab_gtbank.png',
    },
  ];

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
          builder: (context, setState) {
            return Container(
              constraints: BoxConstraints(
                maxHeight: screenSize.height *
                    0.9, // Limit the height to 90% of the screen
              ),
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Close Icon Row
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
                    // Account Details Row
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          w500_17(
                            context,
                            'Copy account details',
                            blackColor,
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromRGBO(243, 244, 246, 1),
                              ),
                              child: FittedBox(
                                // Ensures text scales down if needed
                                fit: BoxFit.scaleDown,
                                child: w500_17(
                                  context,
                                  '806 789 5678',
                                  secondaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Buttons Row
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10, // Adjust as needed
                                vertical: 15,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromRGBO(4, 140, 252, 0.2),
                              ),
                              child: Center(
                                child: w500_17_02(
                                  context,
                                  'Copy Number',
                                  secondaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width:
                                  10), // Add spacing between the two containers
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10, // Adjust as needed
                                vertical: 15,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromRGBO(4, 140, 252, 1),
                              ),
                              child: Center(
                                child: w500_17_02(
                                  context,
                                  'Share Details',
                                  whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Bank Transfer Instructions
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromRGBO(4, 140, 252, 0.5),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                w500_14(
                                  context,
                                  'Add money via bank transfer in just 3 steps',
                                  blackColor,
                                ),
                                SizedBox(height: 10),
                                Wrap(
                                  children: [
                                    w400_11_02(
                                      '1. Copy the account details - ',
                                      blackColor,
                                    ),
                                    w400_11_02(
                                      '8067895678',
                                      secondaryColor,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                w400_11_02(
                                  '2. Open the bank app you want to transfer money from.',
                                  blackColor,
                                ),
                                SizedBox(height: 5),
                                w400_11_02(
                                  '3. Transfer the details amount to your EgoFinance Account.',
                                  blackColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Bank Icons Section
                    w500_14_02(
                      context,
                      "Click on any of the bank icons below to be taken directly to the bank’s app.",
                      blackColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        height: screenSize.height *
                            0.25, // Adjust height dynamically
                        child: GridView.builder(
                          itemCount: bankDetails.length,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (context, index) {
                            final item = bankDetails[index];
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: textfieldColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.asset(
                                        item['imagePath'],
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    w500_12(
                                      context,
                                      item['name'],
                                      blackColor,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
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
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_17(context, 'Add Money', blackColor),
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
        //       child: w600_17(context, 'History', blackColor),
        //     ),
        //   ),
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
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
                        openBottomSheet();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  // Ensures Row doesn't exceed available space
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(10),
                                        child: svgAsset(
                                          'lib/assets/am_bank_trnasfer.svg',
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              10), // Adds spacing between icon and text
                                      Expanded(
                                        // Ensures text wraps properly
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            w500_17(
                                              context,
                                              'Bank Transfer',
                                              blackColor,
                                              // overflow: TextOverflow.ellipsis, // Prevents text overflow
                                            ),
                                            w400_11_02(
                                              'Add money via mobile or internet banking',
                                              blackColor,
                                              // overflow: TextOverflow.ellipsis, // Prevents overflow
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        10), // Adds spacing between text and arrow
                                Container(
                                  height: 22,
                                  width: 22,
                                  child: FittedBox(
                                    // Ensures icon resizes on small screens
                                    child: svgAsset(
                                      'lib/assets/vright_arrow.svg',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: textFieldBorderColor),
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
                                      child: w400_11_02(
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
                                  child: w500_17(
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
                                        color:
                                            Color.fromRGBO(4, 140, 252, 0.15)),
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

              // Divider(
              //     endIndent: screenSize.width * 0.35,
              //     indent: screenSize.width * 0.35,
              //     color: textFieldBorderColor),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                child: Image.asset(
                  'lib/assets/Or.png',
                  // height: 14,
                  // width: 14,
                  // fit: BoxFit.scaleDown,
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     w400_13(context, '-------------------- ', secondaryColor),
                //     w400_13(context, 'OR', secondaryColor),
                //     w400_13(context, ' -------------------', secondaryColor),
                //   ],
                // ),
              ),
              Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.01),
                padding: EdgeInsets.fromLTRB(
                  screenSize.width * 0.02,
                  screenSize.height * 0.01,
                  screenSize.width * 0.02,
                  screenSize.height * 0.01,
                ),
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
                              child: CashDepositScreen(),
                              type: PageTransitionType.leftToRight
                              // duration: Duration(seconds: 1),
                              ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              // Prevents overflow by ensuring Row stays within available space
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              0, 0, 0, 0.08), // Shadow color
                                          offset: Offset(0, 4), // Shadow offset
                                          blurRadius: 4, // Blur intensity
                                        ),
                                      ],
                                      color: Color.fromRGBO(220, 229, 239, 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: svgAsset(
                                      'lib/assets/am_cash_deposit.svg',
                                    ),
                                  ),
                                  SizedBox(width: 10), // Ensures proper spacing
                                  Expanded(
                                    // Ensures text wraps properly
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        w500_17(
                                          context,
                                          'Cash Deposit',
                                          blackColor,
                                        ),
                                        w400_11_03(
                                          'Fund your account with nearby merchants.',
                                          blackColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width:
                                    10), // Adds spacing between text and arrow
                            Container(
                              height: 22,
                              width: 22,
                              child: FittedBox(
                                // Ensures arrow scales properly
                                child: svgAsset(
                                  'lib/assets/vright_arrow.svg',
                                ),
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
                margin: EdgeInsets.only(top: screenSize.height * 0.01),
                padding: EdgeInsets.fromLTRB(
                  screenSize.width * 0.02,
                  screenSize.height * 0.01,
                  screenSize.width * 0.02,
                  screenSize.height * 0.01,
                ),
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
                              child: TopUpScreen(),
                              type: PageTransitionType.leftToRight
                              // duration: Duration(seconds: 1),
                              ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              // Ensures the Row doesn't exceed screen width
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              0, 0, 0, 0.08), // Shadow color
                                          offset: Offset(0, 4), // Shadow offset
                                          blurRadius: 4, // Blur intensity
                                        ),
                                      ],
                                      color: Color.fromRGBO(220, 229, 239, 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: svgAsset(
                                      'lib/assets/am_top_up_cards.svg',
                                    ),
                                  ),
                                  SizedBox(width: 10), // Ensures proper spacing
                                  Expanded(
                                    // Ensures text wraps properly
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 3.0),
                                          child: w500_17(
                                            context,
                                            'Top-up (Card / Account)',
                                            blackColor,
                                          ),
                                        ),
                                        w400_11_03(
                                          'Add money directly from your bank card or account',
                                          blackColor,
                                        ),
                                        // w400_11(
                                        //   '',
                                        //   blackColor,
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width:
                                    10), // Adds spacing between text and arrow
                            Container(
                              height: 22,
                              width: 22,
                              child: FittedBox(
                                // Ensures arrow scales properly
                                child: svgAsset(
                                  'lib/assets/vright_arrow.svg',
                                ),
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
                margin: EdgeInsets.only(top: screenSize.height * 0.01),
                padding: EdgeInsets.fromLTRB(
                  screenSize.width * 0.02,
                  screenSize.height * 0.01,
                  screenSize.width * 0.02,
                  screenSize.height * 0.01,
                ),
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
                              child: BankUssdScreen(),
                              type: PageTransitionType.leftToRight
                              // duration: Duration(seconds: 1),
                              ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              // Ensures the Row doesn't exceed screen width
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              0, 0, 0, 0.08), // Shadow color
                                          offset: Offset(0, 4), // Shadow offset
                                          blurRadius: 4, // Blur intensity
                                        ),
                                      ],
                                      color: Color.fromRGBO(220, 229, 239, 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: svgAsset(
                                      'lib/assets/am_bank_ussd.svg',
                                    ),
                                  ),
                                  SizedBox(width: 10), // Ensures proper spacing
                                  Expanded(
                                    // Ensures text wraps properly
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 3.0),
                                          child: w500_17(
                                            context,
                                            'Bank USSD',
                                            blackColor,
                                          ),
                                        ),
                                        w400_11_03(
                                          'Add with local bank’s USSD code',
                                          blackColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width:
                                    10), // Adds spacing between text and arrow
                            Container(
                              height: 22,
                              width: 22,
                              child: FittedBox(
                                // Ensures arrow scales properly
                                child: svgAsset(
                                  'lib/assets/vright_arrow.svg',
                                ),
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
                margin: EdgeInsets.only(top: screenSize.height * 0.01),
                padding: EdgeInsets.fromLTRB(
                  screenSize.width * 0.02,
                  screenSize.height * 0.01,
                  screenSize.width * 0.02,
                  screenSize.height * 0.01,
                ),
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
                              child: ScanQrcodeScreen(),
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
                            Row(
                              children: [
                                Container(
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
                                    color: Color.fromRGBO(220, 229, 239, 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: svgAsset(
                                    'lib/assets/am_scan.svg',
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
                                        margin: EdgeInsets.only(bottom: 3),
                                        child: w500_17(context, 'Scan QR Code',
                                            blackColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w400_11_03(
                                            'Scan your QR code', blackColor),
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
                margin: EdgeInsets.only(top: screenSize.height * 0.01),
                padding: EdgeInsets.fromLTRB(
                  screenSize.width * 0.02,
                  screenSize.height * 0.01,
                  screenSize.width * 0.02,
                  screenSize.height * 0.01,
                ),
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
                              child: ContacttabScreen(),
                              type: PageTransitionType.leftToRight
                              // duration: Duration(seconds: 1),
                              ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              // Ensures content does not exceed screen width
                              child: Row(
                                children: [
                                  Container(
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
                                      'lib/assets/am_borrow_money.svg',
                                    ),
                                  ),
                                  SizedBox(
                                      width: 10), // Prevents direct collision
                                  Expanded(
                                    // Ensures text wraps properly
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 3.0),
                                          child: w500_17(
                                            context,
                                            'Borrow Money from Others',
                                            blackColor,
                                          ),
                                        ),
                                        w400_11_03(
                                          'Send a request to any EgoFinance user',
                                          blackColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width:
                                    10), // Adds spacing between text and arrow
                            Container(
                              height: 22,
                              width: 22,
                              child: FittedBox(
                                // Ensures arrow scales properly
                                child: svgAsset(
                                  'lib/assets/vright_arrow.svg',
                                ),
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
      ),
    );
  }
}
