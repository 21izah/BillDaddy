import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'dial_ussd_screen.dart';

class BankUssdScreen extends StatefulWidget {
  const BankUssdScreen({super.key});

  @override
  State<BankUssdScreen> createState() => _BankUssdScreenState();
}

class _BankUssdScreenState extends State<BankUssdScreen> {
  List<Map<String, dynamic>> _listOfBanks = [
    {
      'name': 'Access Bank',
      'imagePath': 'lib/assets/ab_access_bank.png',
    },
    {
      'name': 'Diamond Bank',
      'imagePath': 'lib/assets/ab_access_bank.png',
    },
    {
      'name': 'EcoBank Nigeria Bank',
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
      'name': 'Globus Bank',
      'imagePath': 'lib/assets/ab_gtbank.png',
    },
    {
      'name': 'Guaranteed Bank',
      'imagePath': 'lib/assets/ab_gtbank.png',
    },
    {
      'name': 'Heritage Bank',
      'imagePath': 'lib/assets/ab_access_bank.png',
    },
    {
      'name': 'Keystone Bank',
      'imagePath': 'lib/assets/ab_gtbank.png',
    },
    {
      'name': 'Rubies MFB',
      'imagePath': 'lib/assets/ab_access_bank.png',
    },
    {
      'name': 'Stanbic-ibtc Bank Plc',
      'imagePath': 'lib/assets/ab_gtbank.png',
    },
    {
      'name': 'Sterling Bank',
      'imagePath': 'lib/assets/ab_access_bank.png',
    },
    {
      'name': 'Union Bank of Nigeria',
      'imagePath': 'lib/assets/ab_gtbank.png',
    },
    {
      'name': 'United Bank For Africa',
      'imagePath': 'lib/assets/ab_access_bank.png',
    },
    {
      'name': 'United Bank Plc',
      'imagePath': 'lib/assets/ab_gtbank.png',
    },
    {
      'name': 'VFD MFB',
      'imagePath': 'lib/assets/ab_access_bank.png',
    },
    {
      'name': 'Wema Bank PLC',
      'imagePath': 'lib/assets/ab_gtbank.png',
    },
    {
      'name': 'Zenith Bank',
      'imagePath': 'lib/assets/ab_access_bank.png',
    },
  ];
  String selectedBankName = 'Select bank';
  String selectedBankNamessss = 'lib/assets/clarity_bank-line.png';
  final _formKey = GlobalKey<FormState>();
  Color _containerColor = disbaledButton;
  Color _containerTextColor = whiteColor;

  void _validateAndOpenBottomSheet() {
    if (_formKey.currentState?.validate() ?? false) {
      // Form is valid, proceed with submission
      Navigator.of(context).push(
        PageTransition(
            child: DialUssdScreen(
              amount: _amountController.text,
              name: selectedBankName,
              image: selectedBankNamessss,
            ),
            type: PageTransitionType.leftToRight
            // duration: Duration(seconds: 1),
            ),
      );
    }
  }

  void _updateButtonState() {
    setState(() {
      if (_amountController.text.trim().isNotEmpty) {
        _containerColor = secondaryColor;
        _containerTextColor = whiteColor;
      } else {
        _containerColor = disbaledButton;
        _containerTextColor = whiteColor;
      }
    });
  }

  List<Map<String, dynamic>> _filteredBanks = [];
  final _amountController = TextEditingController();
  final _searchController = TextEditingController();

  List<bool> isCheckedList = [];

  bool isVisible = true;
  @override
  void initState() {
    super.initState();

    _amountController.addListener(_updateButtonState);
    _filteredBanks = _listOfBanks;
    isCheckedList = List<bool>.filled(_listOfBanks.length, false);
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
    _searchController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // Sorting the list by the first letter of each bank's name

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: background02,
        appBar: AppBar(
          centerTitle: false,
          title: Visibility(
            visible: isVisible,
            child: w600_17(
              context,
              'Bank USSD',
              blackColor,
            ),
            replacement: w600_17(
              context,
              'Select Bank',
              blackColor,
            ),
          ),
          backgroundColor: whiteColor,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Visibility(
              visible: isVisible,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: screenSize.width * 0.85,
                          margin: EdgeInsets.only(left: 0),
                          child: Expanded(
                            child: w400_12(
                                context,
                                'Fund your EgoFinance Account with your other bank’s USSD code Bank',
                                blackColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         margin:
                  //             EdgeInsets.only(top: screenSize.height * 0.02),
                  //         child: w400_12(context, '', blackColor),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisible = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(4, 140, 252, 00.05),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.7,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    selectedBankNamessss,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: w600_17(
                                  context,
                                  selectedBankName,
                                  Color.fromRGBO(51, 51, 51, 1),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w400_16(
                          context,
                          'Amount',
                          blackColor,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // padding: const EdgeInsets.all(1.0),
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
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
                        // contentPadding: EdgeInsets.only(
                        //   left: 15,
                        //   top: 20,
                        //   right: 10,
                        //   bottom: 20,
                        // ),
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Enter Amount'),
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
                  GestureDetector(
                    onTap: () {
                      _validateAndOpenBottomSheet();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.height * 0.1,
                        left: screenSize.width * 0.04,
                        right: screenSize.width * 0.04,
                        bottom: screenSize.height * 0.02,
                      ),
                      child: Container(
                        height: screenSize.height * 0.05,
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
                  ),
                ],
              ),
              replacement: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      // padding: const EdgeInsets.all(1.0),
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
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
                                color: textFieldBorderColor,
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
                    Container(
                      height: screenSize.height * 0.6,
                      child: ListView.builder(
                        itemCount: _filteredBanks.length,
                        itemBuilder: (context, index) {
                          // Sort the list by name only once before building the list
                          _filteredBanks
                              .sort((a, b) => a['name'].compareTo(b['name']));

                          // Retrieve the current bank details
                          final _bankD = _filteredBanks[index];
                          // selectedBankName
                          // selectedBankNamessss
                          final String bankName = _bankD['name'];
                          final String bankImage = _bankD['imagePath'];
                          final String firstLetter = bankName[0].toUpperCase();

                          // Check if this is the first bank under a new letter
                          bool isFirstInGroup = index == 0 ||
                              firstLetter !=
                                  _filteredBanks[index - 1]['name'][0]
                                      .toUpperCase();

                          // Build the container for each bank item
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Add a letter header only if it's the first bank in the new group
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
                                imagePath: bankImage,
                                bankName8: bankName,
                                // firstLetter: firstLetter,
                                screenSize: screenSize,
                              ),
                            ],
                          );
                        },
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

  Widget buildCountriesContainer({
    required int index,
    required String imagePath,
    required String bankName8,
    // required String firstLetter,
    required Size screenSize,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBankName = bankName8;
          selectedBankNamessss = imagePath;
          for (int i = 0; i < isCheckedList.length; i++) {
            isCheckedList[i] = (i == index);
          }
          isVisible = true;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       Text(firstLetter),
            //     ],
            //   ),
            // ),
            Container(
              width: screenSize.width,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: isCheckedList[index]
                    ? Colors.blue.withOpacity(0.1)
                    : Colors.white,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imagePath),
                    radius: 20,
                  ),
                  SizedBox(width: 15),
                  Text(bankName8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
