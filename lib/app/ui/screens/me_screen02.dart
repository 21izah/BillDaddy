import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// import 'package:hive_flutter/hive_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../controllers/auth/login_controller.dart';
import '../../controllers/scroll_controller.dart';
import '../../utils/constants/data_constant.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MeScreen02 extends StatefulWidget {
  const MeScreen02({super.key});

  @override
  State<MeScreen02> createState() => _MeScreen02State();
}

class _MeScreen02State extends State<MeScreen02> {
  final box = GetStorage();
  // final _username = Hive.box('settingsBox');

  void _showCustomSnackbar(BuildContext context) {
    FlutterClipboard.copy('2083912405');
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(message: 'Account number copied'),
    );
  }

  bool passwordObscured = true; // Default state

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

  @override
  void initState() {
    super.initState();
    loadObscuredState();
    // controller = ScrollController();
    // _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final LoginController loginController = Get.find<LoginController>();

    // final scrollController = ref.read(scrollControllerProvider);
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // controller: scrollController,
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
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/home/reward');
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 0.5),
                      borderRadius: BorderRadius.circular(
                          100), // Optional: if rounded corners are needed
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          // height: 16.71,
                          // width: 20,
                          child: Image.asset(
                            'lib/assets/diamond04.png',
                            height: 19.52,
                            width: 20,
                            color: blackColor,
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
              ],
            ),
            Container(
              width: screenSize.width, // Adjust as needed
              margin: EdgeInsets.only(bottom: 28, top: 36),
              padding: EdgeInsets.all(10),

              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.33, // 33.38% converted to 0.33
                  colors: [
                    Color(0xFF0057D9), // #0057D9
                    Color(0xFF002E73), // #002E73
                    Color(0xFF0046AE), // #0046AE
                  ],
                  stops: [0.0, 0.01, 0.169], // Matches CSS stops
                ),
                borderRadius: BorderRadius.circular(
                    10), // Optional: if rounded corners are needed
                boxShadow: [
                  BoxShadow(
                    color: Color(
                        0x40C4C4C4), // rgba(196, 196, 196, 0.25) -> 0x40C4C4C4
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          w400_14_soft_wrap(context, 'Account No', whiteColor),
                          Row(
                            children: [
                              w700_14(
                                  context,
                                  '${loginController.userData.value!.accountNumber}',
                                  whiteColor),
                              GestureDetector(
                                onTap: () {
                                  _showCustomSnackbar(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.copy,
                                    color: whiteColor,
                                    size: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              w400_14_soft_wrap(
                                  context, 'Total Balance', whiteColor),
                              GestureDetector(
                                onTap: obscure,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Image.asset(
                                    passwordObscured
                                        ? 'lib/assets/eye.png'
                                        : 'lib/assets/eye-slash.png',
                                    height: 12,
                                    width: 12,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: AnimatedSwitcher(
                              duration: Duration(
                                  milliseconds: 300), // Smooth transition
                              child: Text(
                                passwordObscured
                                    ? '₦ ${loginController.userData.value!.balance}'
                                    : '****',
                                key: ValueKey<bool>(
                                    passwordObscured), // Helps AnimatedSwitcher recognize changes
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: whiteColor),
              padding: EdgeInsets.all(0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/updateProfileScreen');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w700_12(
                                        context, 'Update Profile', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: w400_11(
                                        'Update your details', blackColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 12,
                            width: 12,
                            child: svgAsset(
                              'lib/assets/vright_arrow.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: textFieldBorderColor),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/transactionHistory');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w700_12(context,
                                        'Transaction History', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: w400_11(
                                        'Your recent transaction history.',
                                        blackColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 12,
                            width: 12,
                            child: svgAsset(
                              'lib/assets/vright_arrow.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: textFieldBorderColor),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/addPaymentOption');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w700_12(
                                        context, 'Payment Option', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: w400_11(
                                        'Add payment option', blackColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 12,
                            width: 12,
                            child: svgAsset(
                              'lib/assets/vright_arrow.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: textFieldBorderColor),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/AccountLimitScreen');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w700_12(
                                        context, 'Account Limits', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: w400_11(
                                        'Verify your transaction limits',
                                        blackColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 12,
                            width: 12,
                            child: svgAsset(
                              'lib/assets/vright_arrow.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: textFieldBorderColor),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/payId');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child:
                                        w700_12(context, 'Pay ID', blackColor),
                                  ),
                                  Container(
                                    width: screenSize.width * 0.65,
                                    margin: EdgeInsets.only(top: 5),
                                    child: Expanded(
                                      child: w400_11(
                                          'Generate unique code for online transactions',
                                          blackColor),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 12,
                            width: 12,
                            child: svgAsset(
                              'lib/assets/vright_arrow.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: textFieldBorderColor),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/kycScreen');
              },
              child: Container(
                height: 51,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 87, 217, 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3.0, left: 10),
                          child:
                              w500_10(context, 'Complete your KYC', blackColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinearPercentIndicator(
                          width: screenSize.width * 0.6,
                          barRadius: Radius.circular(100),
                          lineHeight: 9,
                          percent: 0.3,
                          progressColor: secondaryColor,
                          backgroundColor: whiteColor,
                        ),
                        w500_12(context, '1/3', blackColor),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: 20, bottom: screenSize.height * 0.02),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: whiteColor),
              padding: EdgeInsets.all(0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/ussd');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w700_12(
                                        context, 'EgoFinance USSD', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: w400_11('*427#', blackColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 12,
                            width: 12,
                            child: svgAsset(
                              'lib/assets/vright_arrow.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: textFieldBorderColor),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/me/support');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child:
                                        w700_12(context, 'Support', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child:
                                        w400_11('Contact Support', blackColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 12,
                            width: 12,
                            child: svgAsset(
                              'lib/assets/vright_arrow.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: textFieldBorderColor),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/referAndEarnScreen');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w700_12(context,
                                        'Refer your friends', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: w400_11('Refer & Earn', blackColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 12,
                            width: 12,
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
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(248, 248, 248, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  10,
                                  10,
                                  10,
                                ),
                                child: svgAsset(
                                  'lib/assets/settings.svg',
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w700_12(
                                        context, 'Settings', blackColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 12,
                            width: 12,
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
