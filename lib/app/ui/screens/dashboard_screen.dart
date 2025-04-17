import 'package:billdaddy/app/controllers/auth/login_controller.dart';
import 'package:billdaddy/app/utils/constants/nav_ids.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';

import '../../data/models/serviceOption.dart';
import 'bottomNavigation.dart';
import 'notification_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // ScrollController controller = Bottomnavigation.controller;

  String _selectedCurrency = 'NGN';
  String _selectedImage = 'lib/assets/NigeriaCircular.png';
  bool passwordObscured = true; // Default state

  bool isChecked = false;

// Create a list to track the checked state of each container
  List<bool> isCheckedList = [false, false, false]; // Assuming 3 containers

  @override
  void initState() {
    super.initState();
    loadObscuredState();

    // controller = ScrollController();
    // _scrollController.addListener(_scrollListener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage('lib/assets/NigeriaCircular.png'), context);
    precacheImage(AssetImage('lib/assets/uSa.png'), context);
    precacheImage(AssetImage('lib/assets/GHS.png'), context);
    precacheImage(AssetImage('lib/assets/empty-wallet-add.png'), context);
    precacheImage(AssetImage('lib/assets/send-2.png'), context);
    precacheImage(AssetImage('lib/assets/withdraw04.png'), context);
    precacheImage(AssetImage('lib/assets/mobile.png'), context);
    precacheImage(AssetImage('lib/assets/electric04.png'), context);
    precacheImage(AssetImage('lib/assets/bar-chart.png'), context);
    precacheImage(AssetImage('lib/assets/tv04.png'), context);
    precacheImage(AssetImage('lib/assets/bettings04.png'), context);
    precacheImage(AssetImage('lib/assets/moneys.png'), context);
    precacheImage(AssetImage('lib/assets/internet04.png'), context);
    precacheImage(AssetImage('lib/assets/category.png'), context);
    precacheImage(AssetImage('lib/assets/hand.png'), context);
    precacheImage(AssetImage('lib/assets/bell.png'), context);
    precacheImage(AssetImage('lib/assets/diamond04.png'), context);
    precacheImage(AssetImage('lib/assets/arrow_ri.png'), context);
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

// Load the obscured state from GetStorage
  void loadObscuredState() async {
    final box = GetStorage();
    final storedValue =
        box.read<bool>('is_Obscure'); // Ensure proper type handling

    if (storedValue != null) {
      setState(() {
        passwordObscured = storedValue;
      });
    }
  }

// Toggle the obscured state and save it
  void obscure() {
    final box = GetStorage();

    setState(() {
      passwordObscured = !passwordObscured;
      box.write('is_Obscure', passwordObscured); // Save the updated value
    });
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
              height: screenSize.height * 0.5,
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
        Navigator.of(context).pop();
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

  // Method to build the entire row container
  Widget buildActionRow(Size screenSize) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      width: screenSize.width,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/addMoneyScreen');
            },
            child: buildActionButton(
              iconPath: 'lib/assets/empty-wallet-add.png',
              label: 'Add Money',
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/transferScreen');
            },
            child: buildActionButton(
              iconPath: 'lib/assets/send-2.png',
              label: 'Transfer',
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/withdrawScreen');
            },
            child: buildActionButton(
              iconPath: 'lib/assets/withdraw04.png',
              label: 'Withdrawal',
            ),
          ),
        ],
      ),
    );
  }

// Method to build individual action button (icon with text)
  Widget buildActionButton({required String iconPath, required String label}) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            height: 30,
            width: 30,
            margin: EdgeInsets.only(top: 5),
            child: Image.asset(
              iconPath,
              height: 14,
              width: 14,
              // fit: BoxFit.scaleDown,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: w500_14(
              context,
              label,
              whiteColor,
            ),
          ),
        ],
      ),
    );
  }

  // Method to build the service options container
  Widget buildServiceOptionsContainer(Size screenSize) {
    return Container(
      padding: EdgeInsets.all(20),
      // height: 230,
      width: screenSize.width,
      decoration: BoxDecoration(
        color: Color.fromRGBO(248, 248, 248, 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0x40C4C4C4), // #C4C4C440 with 25% opacity
            offset: Offset(0, 4), // 0px on x-axis, 4px on y-axis
            blurRadius: 8, // 8px blur radius
            spreadRadius: 0, // 0px spread radius (optional)
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildServiceColumn(
            [
              ServiceOption(
                iconPath: 'lib/assets/mobile.png',
                label: 'Airtime',
                onTap: () {
                  Get.toNamed('/rechargeScreen');
                },
                isImageAsset: true,
                backgroundColor: secondaryColor,
              ),
              ServiceOption(
                iconPath: 'lib/assets/electric04.png',
                label: 'Electricity',
                onTap: () {
                  Get.toNamed('/electricityScreen');
                },
              ),
            ],
          ),
          buildServiceColumn(
            [
              ServiceOption(
                iconPath: 'lib/assets/bar-chart.png',
                label: 'Data',
                onTap: () {
                  Get.toNamed('/dataScreen');
                },
              ),
              ServiceOption(
                iconPath: 'lib/assets/tv04.png',
                label: 'TV',
                onTap: () {
                  Get.toNamed('/tvScreen');
                },
              ),
            ],
          ),
          buildServiceColumn(
            [
              ServiceOption(
                iconPath: 'lib/assets/bettings04.png',
                label: 'Bettings',
                onTap: () {
                  Get.toNamed('/bettingScreen');
                },
              ),
              ServiceOption(
                iconPath: 'lib/assets/moneys.png',
                label: 'Giftcards',
                onTap: () {
                  Get.toNamed('/gitcardScreen');
                },
              ),
            ],
          ),
          buildServiceColumn(
            [
              ServiceOption(
                iconPath: 'lib/assets/internet04.png',
                label: 'Internet',
                onTap: () {
                  Get.toNamed('/internetScreen');
                },
              ),
              ServiceOption(
                iconPath: 'lib/assets/category.png',
                label: 'More',
                onTap: () {
                  debugPrint('pressed paymet button');
                  // Get.toNamed('/payment');
                  // Get.toNamed('/payment/payment02', id: NavIds.payment);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

// Helper method to build individual service column
  Widget buildServiceColumn(List<ServiceOption> options) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: options.map((option) => buildServiceItem(option)).toList(),
    );
  }

// Helper method to build individual service item
  Widget buildServiceItem(ServiceOption option) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: option.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: whiteColor,
                // border: Border.all(color: textFieldBorderColor),
              ),
              //   child: option.isImageAsset
              //       ? Image.asset(
              //           option.iconPath,
              //           fit: BoxFit.scaleDown,
              //         )
              //       : svgAsset(
              //           option.iconPath,
              //         ),
              // ),
              child: Image.asset(
                option.iconPath,
                fit: BoxFit.scaleDown,
                height: 20,
                width: 20,
              )),
          Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.01,
              bottom: screenSize.height * 0.03,
            ),
            child: w400_14(
              context,
              option.label,
              blackColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final box = GetStorage();
    final LoginController loginController = Get.find<LoginController>();

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // controller: controller,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: secondaryColor,
                      child: Icon(
                        Icons.person,
                        color: whiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              w400_10(context, 'Welcome, ', blackColor),
                              Image.asset(
                                'lib/assets/hand.png',
                                height: 14,
                                width: 14,
                                // fit: BoxFit.scaleDown,
                              ),
                            ],
                          ),
                          w500_12(context, '${box.read('fullName')}' ?? '',
                              blackColor),
                        ],
                      ),
                    ),

                    // secondaryColor),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'lib/assets/check.png',
                      height: 24,
                      width: 24,
                      // fit: BoxFit.scaleDown,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                              child: NotificationScreen(),
                              type: PageTransitionType.leftToRight
                              // duration: Duration(seconds: 1),
                              ),
                        );
                      },
                      child: Image.asset(
                        'lib/assets/bell.png',
                        height: 24,
                        width: 24,
                        // fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/home/reward', id: NavIds.home);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // height: 16.71,
                      // width: 20,
                      child: Image.asset(
                        'lib/assets/diamond04.png',
                        height: 16.71,
                        width: 20,
                        // fit: BoxFit.scaleDown,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: w500_16(context, 'Reward', blackColor),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                openBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    // width: 117,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(4, 140, 252, 0.15),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 10,
                          child: Image.asset(
                            _selectedImage,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: w500_08(
                            context,
                            '${_selectedCurrency} Amount',
                            blackColor,
                          ),
                        ),
                        Icon(
                          size: 16,
                          Icons.keyboard_arrow_down,
                          color: cardRa1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        w400_16(
                          context,
                          'Total Balance',
                          blackColor,
                        ),
                        passwordObscured
                            ? GestureDetector(
                                onTap: obscure,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5.0,
                                  ),
                                  child: Image.asset(
                                    'lib/assets/eye.png',
                                    height: 24,
                                    width: 24,
                                    // fit: BoxFit.scaleDown,
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: obscure,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5.0,
                                  ),
                                  child: Image.asset(
                                    'lib/assets/eye-slash.png',
                                    height: 24,
                                    width: 24,
                                    // fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                height: screenSize.height * 0.05,
                width: screenSize.width * 0.8,
                child: passwordObscured
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(() {
                            if (loginController.userData.value == null) {
                              return Text('Loading...');
                            }
                            return Container(
                              child: w700_20(
                                context,
                                '₦ ${loginController.userData.value!.balance}',
                                blackColor,
                              ),
                            );
                          })

                          //   Text(
                          //       '₦ ${loginController.userData.value!.balance}');
                          // }),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          w700_20(
                            context,
                            '****',
                            blackColor,
                          ),
                        ],
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: buildActionRow(screenSize),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 117,
                    child: w700_17(
                      context,
                      'Payment',
                      blackColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 10),
              child: buildServiceOptionsContainer(screenSize),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/transactionHistory');
                },
                child: Container(
                  height: 60,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.97),
                    gradient: SweepGradient(
                      startAngle:
                          -22.51 / 180 * 3.14, // Convert degrees to radians
                      colors: [
                        Color.fromRGBO(0, 32, 243, 0.88), // #0085F3
                        Color.fromRGBO(0, 97, 243, 0.97), // #1A1F71
                        Color.fromRGBO(0, 32, 243, 0.88),
                        Color.fromRGBO(0, 32, 243, 0.88),
                      ],
                      // background: conic-gradient(from 190.53deg at 50% 50%, rgba(0, 97, 243, 0.97) 0deg, rgba(0, 32, 243, 0.88) 360deg);

                      stops: [0.35, 0.36, 1.99, 2.0],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: w500_14(
                            context,
                            'Check',
                            whiteColor,
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Image.asset(
                                'lib/assets/arrow_ri.png',
                                fit: BoxFit.scaleDown,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              w500_14(
                                context,
                                'Transaction History',
                                whiteColor,
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: whiteColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20.0),
            //   child: Container(
            //     width: screenSize.width,
            //     decoration: BoxDecoration(
            //       color: whiteColor,
            //       borderRadius: BorderRadius.circular(10.95),
            //       border: Border.all(
            //         color: Color.fromRGBO(4, 140, 252, 0.5),
            //       ),
            //     ),
            //     child: Padding(
            //       padding: EdgeInsets.fromLTRB(
            //         screenSize.width * 0.04,
            //         screenSize.height * 0.02,
            //         screenSize.width * 0.04,
            //         screenSize.height * 0.02,
            //       ),
            //       child: Row(
            //         children: [
            //           Container(
            //             height: 40,
            //             width: 40,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(100),
            //             ),
            //             child: svgAsset(
            //               'lib/assets/refer&earn.svg',
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(left: 10.0),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 w700_17(
            //                   context,
            //                   'Refer & Earn',
            //                   blackColor,
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(top: 5.0),
            //                   child: Row(
            //                     children: [
            //                       w400_14(
            //                         context,
            //                         'Earn ',
            //                         blackColor,
            //                       ),
            //                       w400_14(
            //                         context,
            //                         '₦1000 ',
            //                         blackColor,
            //                       ),
            //                       w400_14(
            //                         context,
            //                         'cashback for referral',
            //                         blackColor,
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10.95),
                  border: Border.all(
                    color: Color.fromRGBO(4, 140, 252, 0.5),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    screenSize.width * 0.04,
                    screenSize.height * 0.02,
                    screenSize.width * 0.04,
                    screenSize.height * 0.02,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: svgAsset(
                          'lib/assets/refer&earn.svg',
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: w500_14_03(
                                  context,
                                  'Refer & Earn',
                                  blackColor,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: w400_10(
                                  context,
                                  'Earn ₦1000 cashback for referral',
                                  blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10.95),
                  border: Border.all(
                    color: Color.fromRGBO(4, 140, 252, 0.5),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    screenSize.width * 0.04,
                    screenSize.height * 0.02,
                    screenSize.width * 0.04,
                    screenSize.height * 0.02,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: svgAsset(
                          'lib/assets/refer&earn.svg',
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: w500_14_03(
                                  context,
                                  'Buy airtime, Get 3% cash back',
                                  blackColor,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: w400_10(
                                  context,
                                  'Get 3% cashback instantly on every airtime recharge',
                                  blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
