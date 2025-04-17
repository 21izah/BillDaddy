import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../../../controllers/auth/login_controller.dart';
import '../../../controllers/transfer/transfer_controller.dart';
import '../../../controllers/transfer/transfer_to_other_bank_provider.dart';
import '../../../utils/constants/data_constant.dart';
import '../Tfavorite_screen.dart';
import '../favorite03.dart';
import 'transfer_to_other_bank_screen.dart';

class TransferToOtherBankTabScreen extends StatefulWidget {
  const TransferToOtherBankTabScreen({super.key});

  @override
  State<TransferToOtherBankTabScreen> createState() =>
      _TransferToOtherBankTabScreenState();
}

class _TransferToOtherBankTabScreenState
    extends State<TransferToOtherBankTabScreen> {
  List<Map<String, dynamic>> _listOfBanks = [
    {
      'name': 'Access Bank',
      'imagePath': 'lib/assets/ab_access_bank.png',
    },
    {
      'name': 'Diamond Bank',
      'imagePath': 'lib/assets/ab_access_bank.png',
    },
    // ... rest of your bank list
  ];

  String selectedBankName = 'Select bank';
  String? selectedBankCode;
  String selectedBankNamessss = 'lib/assets/clarity_bank-line.png';
  List<Map<String, dynamic>> _filteredBanks = [];
  List<bool> isCheckedList = [];
  int _previousLength = 0;
  int _currentLength = 0;

  final _bankAccountController = TextEditingController();
  final _selectBankController = TextEditingController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectBankController.text = 'Select Bank Account';
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final TransferToOtherBankController transferToOtherBankController =
            Get.find<TransferToOtherBankController>();
        await transferToOtherBankController.getAllBanks();
        final bankList = transferToOtherBankController.listOfBanks;
        transferToOtherBankController.isCheckedList =
            List<bool>.filled(bankList.length, false);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to fetch bank data: $e')),
          );
        }
      }
    });

    _filteredBanks = _listOfBanks;
    isCheckedList = List<bool>.filled(_listOfBanks.length, false);

    _bankAccountController.addListener(() {
      int _currentLength = _bankAccountController.text.length;

      if (_currentLength == 10 &&
          _previousLength != 10 &&
          _selectBankController.text == 'Select Bank Account') {
        // show bank error
      } else if (_currentLength == 10 &&
          _previousLength != 10 &&
          _selectBankController.text != 'Select Bank Account') {
        _handleVerifyAccount();
      } else if (_currentLength < 10 && _previousLength == 10) {
        final TransferToOtherBankController transferToOtherBankController =
            Get.find<TransferToOtherBankController>();
        Future.microtask(
            () => transferToOtherBankController.resetTransferState());
      }

      _previousLength = _currentLength;
    });
  }

  Future<void> _handleVerifyAccount() async {
    final TransferToOtherBankController transferToOtherBankController =
        Get.find<TransferToOtherBankController>();
    await transferToOtherBankController.createTransferRecipient(
      selectedBankCode,
      _bankAccountController.text,
    );
  }

  void runFilter(String enterKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty) {
      results = _listOfBanks;
    } else {
      results = _listOfBanks
          .where((user) =>
              user['name']!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredBanks = results;
    });
  }

  @override
  void dispose() {
    _bankAccountController.dispose();
    _selectBankController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _handleVerifyOwnerAccount();
  }

  void openBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: textfieldColor,
      context: context,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;

        return GetBuilder<TransferToOtherBankController>(
          builder: (transferToOtherBankController) {
            return Container(
              margin: EdgeInsets.all(20),
              height: screenSize.height * 0.8,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: TextFormField(
                      onChanged: (value) {
                        transferToOtherBankController.runFilter(value);
                      },
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
                              color: textFieldBorderColor,
                            ),
                          ],
                        ),
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_12_r(
                              context,
                              'Search Bank Name',
                              Color.fromRGBO(51, 51, 51, 0.2),
                            ),
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
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          transferToOtherBankController.filteredBanks.length,
                      itemBuilder: (context, index) {
                        final bank =
                            transferToOtherBankController.filteredBanks[index];
                        final String? bankName = bank['name'];
                        final String bankCode = bank['code'];

                        if (bankName == null) {
                          return SizedBox.shrink();
                        }

                        final String firstLetter = bankName[0].toUpperCase();

                        bool isFirstInGroup = index == 0 ||
                            firstLetter !=
                                transferToOtherBankController
                                    .filteredBanks[index - 1]['name'][0]
                                    .toUpperCase();

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (isFirstInGroup)
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 20),
                                child: Text(
                                  firstLetter,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            buildCountriesContainer(
                              index: index,
                              bankName8: bankName,
                              bankCode: bankCode,
                              screenSize: screenSize,
                            ),
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

  final TransferController transferController = Get.find<TransferController>();

  Widget buildCountriesContainer({
    required int index,
    required String? bankName8,
    required String bankCode,
    required Size screenSize,
  }) {
    return GestureDetector(
      onTap: () {
        final TransferController transferController =
            Get.find<TransferController>();
        transferController.resetSelectedBank();
        transferController.selectBank(bankCode);
        _selectBankController.text = '${bankName8}';
        selectedBankName = '${bankName8}';
        selectedBankCode = '${bankCode}';
        if (_bankAccountController.text.length == 10) {
          _handleVerifyAccount();
        }
        Navigator.of(context).pop();
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: transferController.selectedBankCode == bankCode
                    ? Colors.blue.withOpacity(0.1)
                    : Colors.white,
              ),
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Expanded(child: Text('${bankName8}')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleVerifyOwnerAccount() async {
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
    return GetBuilder<TransferToOtherBankController>(
      builder: (transferToOtherBankController) {
        final screenSize = MediaQuery.of(context).size;
        final TransferController transferController =
            Get.find<TransferController>();

        var ownerData02 = transferController.accountDetail2.value;
        var ownerDataId02 = ownerData02?.wallet.id ?? '0.00';

        var accountDetails =
            transferToOtherBankController.verifiedBankNumberModel.value;
        final verifiedAccountDetails = accountDetails;
        var verifiedUserName =
            verifiedAccountDetails?.data!.details?.accountName;

        debugPrint('my verifired details ${accountDetails}');

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: DefaultTabController(
            length: 2,
            child: WillPopScope(
              onWillPop: () async {
                transferController.resetSelectedBank();
                transferToOtherBankController.resetTransferState();
                return true;
              },
              child: Scaffold(
                backgroundColor: background02,
                appBar: transferToOtherBankController.isGetBankListLoading
                    ? null
                    : AppBar(
                        centerTitle: false,
                        title: w600_17(
                          context,
                          'Transfer to Bank Account',
                          blackColor,
                        ),
                        backgroundColor: whiteColor,
                      ),
                body: transferToOtherBankController.isGetBankListLoading
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Lottie.asset('lib/assets/rPUhRrTlFG.json'),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 20, 0, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 10),
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
                                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: blackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                  cursorColor: secondaryColor,
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  controller: _bankAccountController,
                                  validator: (value) =>
                                      value!.isEmpty ? 'Account No' : null,
                                  decoration: InputDecoration(
                                    label: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Local Bank Account'),
                                      ],
                                    ),
                                    labelStyle:
                                        buttonText04Style(cardRadialColor01),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
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
                                    counterText: '',
                                  ),
                                ),
                              ),
                              transferToOtherBankController
                                      .isSuccessAndLoadingContainerShowing
                                  ? Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: disbaledButton),
                                      margin:
                                          EdgeInsets.fromLTRB(20, 5, 20, 10),
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: transferToOtherBankController
                                                    .isLoading
                                                ? Container(
                                                    height: 10,
                                                    width: 10,
                                                    child:
                                                        CircularProgressIndicator(
                                                      backgroundColor:
                                                          Colors.blue,
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
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                          transferToOtherBankController
                                                  .isLoading
                                              ? w500_12(
                                                  context,
                                                  'Verifying account details',
                                                  secondaryColor,
                                                )
                                              : w500_12(
                                                  context,
                                                  '${verifiedUserName}',
                                                  secondaryColor,
                                                ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              transferToOtherBankController
                                      .isFailuresContainerShowing
                                  ? Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color.fromARGB(
                                              255, 235, 165, 165)),
                                      margin:
                                          EdgeInsets.fromLTRB(20, 5, 20, 10),
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Icon(
                                              Icons.cancel,
                                              color: whiteColor,
                                              size: 15,
                                            ),
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
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
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
                                    openBottomSheet();
                                  },
                                  style: TextStyle(
                                    color: blackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                  cursorColor: secondaryColor,
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  controller: _selectBankController,
                                  validator: (value) =>
                                      value!.isEmpty ? 'Account No' : null,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
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
                                    counterText: '',
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  transferToOtherBankController.isButtonEnabled
                                      ? null
                                      : Navigator.of(context)
                                          .push(
                                          PageTransition(
                                              child: TransferToOtherBankScreen(
                                                bankCode: '${selectedBankCode}',
                                                recepientName:
                                                    '${verifiedUserName}',
                                                bankName: selectedBankName,
                                                bankAccount:
                                                    _bankAccountController.text,
                                                walletId: ownerDataId02,
                                              ),
                                              type: PageTransitionType
                                                  .leftToRight),
                                        )
                                          .then((_) {
                                          final TransferController
                                              transferController =
                                              Get.find<TransferController>();
                                          transferController
                                              .resetTransferState();
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
                                      color: transferToOtherBankController
                                              .isButtonEnabled
                                          ? disbaledButton
                                          : secondaryColor,
                                    ),
                                    child: Center(
                                      child:
                                          w500_17(context, 'Next', whiteColor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, bottom: 10),
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
                                labelPadding:
                                    EdgeInsets.fromLTRB(10, 0, 100, 0),
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
                                  TrecentContactScreen(),
                                  FavoritesScreen03(),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
