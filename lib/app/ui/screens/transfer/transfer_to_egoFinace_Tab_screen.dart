import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../controllers/auth/login_controller.dart';
import '../../../controllers/transfer/transfer_controller.dart';
import '../../../utils/constants/data_constant.dart';
import '../favorite02.dart';
import '../recent_contact_screen.dart';
import 'transfer_to_egoFinace_screen.dart';

class TransferToEgofinaceTabScreen extends StatefulWidget {
  const TransferToEgofinaceTabScreen({
    super.key,
  });

  @override
  State<TransferToEgofinaceTabScreen> createState() =>
      _TransferToEgofinaceTabScreenState();
}

class _TransferToEgofinaceTabScreenState
    extends State<TransferToEgofinaceTabScreen> {
  final _accounNumber = TextEditingController();

  bool isChecked = true;
  int _previousLength = 0; // Track previous length
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   var ownerData = ref.read(userDataProvider);

    //   var ownerDataAccount = ownerData?.accountNumber ?? '';

    //   ref.read(transferProvider).verifyOwnerAccount(ref, ownerDataAccount);
    // });
    _accounNumber.addListener(() {
      int currentLength = _accounNumber.text.length;

      if (currentLength == 10 && _previousLength != 10) {
        // Call verification function when length reaches 10
        _handleVerifyAccount();
      } else if (currentLength < 10 && _previousLength == 10) {
        // Reset state when length decreases from 10 to 9 or fewer
        // Reset state when input length decreases from 10 to 9 or fewer
        final TransferController transferController =
            Get.find<TransferController>();
        Future.microtask(() => transferController.resetTransferState());
      }

      _previousLength = currentLength; // Update previous length
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _handleVerifyOwnerAccount();
  }

  @override
  void dispose() {
    _accounNumber.removeListener(() {});
    _accounNumber.dispose();
    super.dispose();
  }

  Color _containerColor = btnDisabled;
  Color _containerTextColor = whiteColor;

  void _updateButtonState() {
    setState(() {
      if (_accounNumber.text.length == 10) {
        _containerColor = secondaryColor;
        _containerTextColor = whiteColor;
      } else {
        _containerColor = btnDisabled;
        _containerTextColor = whiteColor;
      }
    });
  }

  Future<void> _handleVerifyAccount() async {
    // Validate form inputs
    final TransferController transferController =
        Get.find<TransferController>();

    // final _username = Hive.box('settingsBox');

    await transferController.simulateVerifyTransferToEgoFinaceAccount(
      _accounNumber.text,
    );
  }

  Future<void> _handleVerifyOwnerAccount() async {
    // Validate form inputs

    final TransferController transferController =
        Get.find<TransferController>();
    final LoginController loginController = Get.find<LoginController>();

    var ownerData = loginController.userData.value;

    var ownerDataAccount = ownerData?.accountNumber ?? '';

    await transferController.verifyOwnerAccount(
      ownerDataAccount,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final TransferController transferController =
        Get.find<TransferController>();

    var accountDetails = transferController.accountDetails1.value;
    var userAccountName = accountDetails?.user.name ?? '';
    var userAccountNumber = accountDetails?.wallet.accountNumber ?? '';
    var userAccountId = accountDetails?.wallet.id ?? '';
    var ownerData02 = transferController.accountDetail2.value;
    var ownerDataId02 = ownerData02?.wallet.id ?? '0.00';

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        length: 2,
        child: WillPopScope(
          onWillPop: () async {
            // Reset state before popping
            final TransferController transferController =
                Get.find<TransferController>();

            transferController.resetTransferState();

            return true; // Allows popping the screen
          },
          child: Scaffold(
            backgroundColor: background02,
            appBar: AppBar(
              centerTitle: false,
              title: w600_17(
                context,
                'Transfer to EgoFinance Account',
                blackColor,
              ),
              backgroundColor: whiteColor,
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20, 0, 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
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
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: TextFormField(
                        // onTapOutside: (event) {
                        //   final transferController = ref.watch(transferProvider);
                        //   transferController.resetTransferState();
                        // },
                        style: TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        cursorColor: secondaryColor,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: _accounNumber,
                        validator: (value) =>
                            value!.isEmpty ? 'EgoFinance Account No' : null,
                        decoration: InputDecoration(
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('EgoFinance Account No'),
                            ],
                          ),
                          labelStyle: buttonText04Style(cardRadialColor01),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: whiteColor,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: whiteColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: whiteColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: whiteColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          counterText: '', // Remove the character counter1414
                        ),
                      ),
                    ),
                    transferController.isSuccessAndLoadingContainerShowing
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: disbaledButton),
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: transferController.isLoading
                                      ? Container(
                                          height: 10,
                                          width: 10,
                                          child: CircularProgressIndicator(
                                            backgroundColor: Colors.blue,
                                            color: Colors.grey[200],
                                          ),
                                        )
                                      : Icon(
                                          Icons.check,
                                          color: whiteColor,
                                          size: 15,
                                        ),
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                transferController.isLoading
                                    ? w500_12(
                                        context,
                                        'Verifying account details',
                                        secondaryColor,
                                      )
                                    : w500_12(
                                        context,
                                        '${userAccountName}',
                                        secondaryColor,
                                      ),
                              ],
                            ),
                          )
                        : Container(),
                    transferController.isFailuresContainerShowing
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    const Color.fromARGB(255, 235, 165, 165)),
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Icon(
                                    Icons.cancel,
                                    color: whiteColor,
                                    size: 15,
                                  ),
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                Expanded(
                                  child: w500_12(
                                    context,
                                    'Account Verification failed. Please check the details or try again',
                                    Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    GestureDetector(
                      onTap: () {
                        print('onwer id is ${ownerDataId02}');
                        print('user account hklis ${userAccountNumber}');
                        transferController.isButtonEnabled
                            ? null
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TransferToEgofinaceScreen(
                                    name: userAccountName.toUpperCase(),
                                    accountNumber: userAccountNumber,
                                    walletId: ownerDataId02,
                                  ),
                                ),
                              ).then((_) {
                                // Reset state before popping
                                final TransferController transferController =
                                    Get.find<TransferController>();
                                transferController.resetTransferState();
                              });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 10,
                          right: 20,
                          bottom: screenSize.height * 0.02,
                        ),
                        child: Container(
                          height: screenSize.height * 0.05,
                          width: screenSize.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: transferController.isButtonEnabled
                                ? disbaledButton
                                : secondaryColor,
                          ),
                          child: Center(
                            child: w500_17(context, 'Next', whiteColor),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          w500_14(
                            context,
                            'Beneficiaries',
                            blackColor,
                          ),
                        ],
                      ),
                    ),
                    TabBar(
                      dividerColor: whiteColor,
                      labelColor: Colors.pink,
                      unselectedLabelColor: Colors.orange,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding: EdgeInsets.only(right: 10),
                      // labelPadding: EdgeInsets.only(right: screenSize.width * 0.2),
                      // padding: EdgeInsets.only(right: screenSize.width * 0.3),
                      labelPadding: EdgeInsets.fromLTRB(10, 0, 100, 0),
                      dividerHeight: 50,
                      indicatorColor: secondaryColor,
                      tabs: [
                        Tab(
                          child: Text(
                            'Recents',
                            style: TextStyle(color: blackColor),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Favourites',
                            style: TextStyle(color: blackColor),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: screenSize.height * 0.3,
                      child: TabBarView(children: [
                        RecentContactScreen(),
                        FavoritesScreen02(),
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color:
                                Color(0x40C4C4C4), // #C4C4C440 with 25% opacity
                            offset:
                                Offset(0, 4), // 0px on x-axis, 4px on y-axis
                            blurRadius: 8, // 8px blur radius
                            spreadRadius: 0, // 0px spread radius (optional)
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.08),
                                                offset: Offset(0, 4),
                                                blurRadius: 4,
                                              ),
                                            ],
                                            color: Color.fromRGBO(
                                                220, 229, 239, 1),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Image.asset(
                                            'lib/assets/tEgologo.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(),
                                                  child: w600_17(
                                                      context,
                                                      'Explore Community',
                                                      blackColor),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(),
                                                  child: w400_12(
                                                      context,
                                                      'Explore EgoFinance community, chats, latest updates...',
                                                      blackColor),
                                                ),
                                              ],
                                            ),
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
            ),
          ),
        ),
      ),
    );
  }
}
