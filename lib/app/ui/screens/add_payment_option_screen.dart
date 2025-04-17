import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'top_up_bank_account_screen.dart';
import 'top_up_debit_card_screen.dart';
import 'top_up_screen02.dart';

class AddPaymentOptionScreen extends StatefulWidget {
  const AddPaymentOptionScreen({super.key});

  @override
  State<AddPaymentOptionScreen> createState() => _AddPaymentOptionScreenState();
}

class _AddPaymentOptionScreenState extends State<AddPaymentOptionScreen> {
  bool isVisible = true;
  bool isDebitCardVisible = true;
  bool isBankAccountVisible = true;
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
  List<Map<String, dynamic>> _filteredBanks = [];
  final _amountController = TextEditingController();
  final _searchController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expireCardController = TextEditingController();
  final _cvvController = TextEditingController();
  final _pinController = TextEditingController();
  final _bankAccountController = TextEditingController();

  List<bool> isCheckedList = [];

  @override
  void initState() {
    super.initState();

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
    _cardNumberController.dispose();
    _expireCardController.dispose();
    _cvvController.dispose();
    _pinController.dispose();
    _bankAccountController.dispose();
    super.dispose();
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
            );
          },
        );
      },
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
        });
        Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: background02,
        appBar: AppBar(
          backgroundColor: whiteColor,
          leadingWidth: screenSize.width,
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
                      Get.offAllNamed('/me/settings');
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: w600_17(context, 'Add Payment Option', blackColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: screenSize.height * 0.7,
                margin: EdgeInsets.only(
                  top: 10,
                ),
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
                        setState(() {
                          isDebitCardVisible = !isDebitCardVisible;
                        });
                      },
                      child: isBankAccountVisible
                          ? Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                                          'lib/assets/am_scan.svg',
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
                                              child: w600_17(context,
                                                  'Debit Card', blackColor),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(),
                                              child: w400_12(
                                                  context,
                                                  'Add card details',
                                                  blackColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  isDebitCardVisible
                                      ? Transform.scale(
                                          scale: 0.7,
                                          child: Container(
                                            child: svgAsset(
                                              'lib/assets/vright_arrow.svg',
                                            ),
                                          ),
                                        )
                                      : Icon(Icons.keyboard_arrow_down_rounded),
                                ],
                              ),
                            )
                          : Container(),
                    ),
                    isDebitCardVisible
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isBankAccountVisible = !isBankAccountVisible;
                                // if (isDebitCardVisible = true) {
                                //   isDebitCardVisible = false;
                                // } else if (isDebitCardVisible = false) {
                                //   isDebitCardVisible = true;
                                // }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                                          'lib/assets/am_scan.svg',
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
                                              child: w600_17(context,
                                                  'Bank Account', blackColor),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(),
                                              child: w400_12(
                                                  context,
                                                  'Add bank details',
                                                  blackColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  isBankAccountVisible
                                      ? Transform.scale(
                                          scale: 0.7,
                                          child: svgAsset(
                                            'lib/assets/vright_arrow.svg',
                                          ),
                                        )
                                      : Transform.scale(
                                          scale: 0.9,
                                          child: Icon(Icons
                                              .keyboard_arrow_down_rounded)),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    // box 1 and 3
                    isDebitCardVisible
                        ? Container()
                        : Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(1.0),
                                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'email is required';
                                        }
                                        return null;
                                      },
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(51, 51, 51, 1),
                                          fontSize: 25),
                                      cursorColor: secondaryColor,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(
                                            19), // Max 19 including spaces
                                        CreditCardInputFormatter(), // Custom formatter for grouping
                                      ],
                                      controller: _cardNumberController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          top: 20,
                                          right: 10,
                                          bottom: 10,
                                        ),
                                        // prefixIcon: Container(
                                        //   width: screenSize.width * 0.03,
                                        //   child: Row(
                                        //     mainAxisAlignment: MainAxisAlignment.center,
                                        //     children: [
                                        //       svgAsset(
                                        //         'lib/assets/uim_master-card.svg',
                                        //       ),
                                        //       Text('4123'),
                                        //       Text('|'),
                                        //     ],
                                        //   ),
                                        // ),
                                        label: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('Master card number  '),
                                            Icon(
                                              Icons.star,
                                              color: Colors.red,
                                              size: 7,
                                            )
                                          ],
                                        ),
                                        // labelText: 'Phone number',
                                        labelStyle: GoogleFonts.quicksand(
                                            color: Colors.black),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintText: '****    ****     ****',
                                        hintStyle: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromRGBO(51, 51, 51, 0.4),
                                            fontSize: 13),
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: textFieldBorderColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: textFieldBorderColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: textFieldBorderColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: screenSize.width * 0.4,
                                        padding: const EdgeInsets.all(1.0),
                                        margin:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'This field is required';
                                            }
                                            if (!RegExp(r'^\d{2}/\d{2}$')
                                                .hasMatch(value)) {
                                              return 'Invalid format (MM/YY)';
                                            }
                                            return null;
                                          },
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Color.fromRGBO(51, 51, 51, 1),
                                              fontSize: 25),
                                          cursorColor: secondaryColor,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                5), // Max 5 characters (MM/YY)
                                            ExpirationDateFormatter(), // Custom formatter for "MM/YY"
                                          ],
                                          controller: _expireCardController,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                              left: 15,
                                              top: 20,
                                              right: 10,
                                              bottom: 10,
                                            ),
                                            label: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('Expires  '),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 7,
                                                )
                                              ],
                                            ),
                                            // labelText: 'Phone number',
                                            labelStyle: GoogleFonts.quicksand(
                                                color: Colors.black),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            hintText: 'MM /YY',
                                            hintStyle: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    51, 51, 51, 0.4),
                                                fontSize: 13),
                                            filled: true,
                                            fillColor: Colors.white,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldBorderColor),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldBorderColor),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldBorderColor),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: screenSize.width * 0.4,
                                        padding: const EdgeInsets.all(1.0),
                                        margin:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'email is required';
                                            }
                                            return null;
                                          },
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Color.fromRGBO(51, 51, 51, 1),
                                              fontSize: 25),
                                          cursorColor: secondaryColor,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                3), // Limit to 3 characters
                                            FilteringTextInputFormatter
                                                .digitsOnly, // Allow only digits
                                          ],
                                          controller: _cvvController,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                              left: 15,
                                              top: 20,
                                              right: 10,
                                              bottom: 10,
                                            ),
                                            label: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('CVV  '),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 7,
                                                )
                                              ],
                                            ),
                                            // labelText: 'Phone number',
                                            labelStyle: GoogleFonts.quicksand(
                                                color: Colors.black),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            hintText: '853',
                                            hintStyle: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    51, 51, 51, 0.4),
                                                fontSize: 13),
                                            filled: true,
                                            fillColor: Colors.white,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldBorderColor),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldBorderColor),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldBorderColor),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(1.0),
                                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Pin is required';
                                        }
                                        return null;
                                      },
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(51, 51, 51, 1),
                                          fontSize: 25),
                                      cursorColor: secondaryColor,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(
                                            4), // Limit to 3 characters
                                        FilteringTextInputFormatter
                                            .digitsOnly, // Allow only digits
                                      ],
                                      controller: _pinController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 15,
                                          top: 20,
                                          right: 10,
                                          bottom: 10,
                                        ),
                                        label: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('Pin  '),
                                            Icon(
                                              Icons.star,
                                              color: Colors.red,
                                              size: 7,
                                            )
                                          ],
                                        ),
                                        // labelText: 'Phone number',
                                        labelStyle: GoogleFonts.quicksand(
                                            color: Colors.black),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintText: '****',
                                        hintStyle: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromRGBO(51, 51, 51, 0.4),
                                            fontSize: 13),
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: textFieldBorderColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: textFieldBorderColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: textFieldBorderColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        PageTransition(
                                            child: TopUpBankAccountScreen(
                                              bankCardDetails:
                                                  _cardNumberController.text,
                                            ),
                                            type: PageTransitionType.leftToRight
                                            // duration: Duration(seconds: 1),
                                            ),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: screenSize.height * 0.25,
                                        bottom: screenSize.height * 0.2,
                                      ),
                                      child: Container(
                                        height: screenSize.height * 0.05,
                                        width: screenSize.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: secondaryColor,
                                        ),
                                        child: Center(
                                          child: w500_17(
                                              context, 'Confirm', whiteColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                  top: screenSize.height * 0.27,
                                  left: screenSize.width * 0.5,
                                  child: Image.asset(
                                      'lib/assets/add_payment_card.png')),
                            ],
                          ),
                    // box 1 and 4
                    isBankAccountVisible
                        ? Container()
                        : Column(
                            children: [
                              // GestureDetector(
                              //   onTap: () {
                              //     // Navigator.of(context).push(
                              //     //   PageTransition(
                              //     //     child: ScanQrcodeScreen(),
                              //     //     type: PageTransitionType.leftToRight
                              //     //     duration: Duration(seconds: 1),
                              //     //   ),
                              //     // );
                              //   },
                              //   child: Container(
                              //     margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              //     color: Colors.transparent,
                              //     child: Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         Row(
                              //           children: [
                              //             Container(
                              //               height: 40,
                              //               width: 40,
                              //               padding: EdgeInsets.all(10),
                              //               decoration: BoxDecoration(
                              //                 boxShadow: [
                              //                   BoxShadow(
                              //                     color: Color.fromRGBO(0, 0, 0,
                              //                         0.08), // Set the shadow color
                              //                     offset: Offset(0,
                              //                         4), // Horizontal and vertical offset
                              //                     blurRadius:
                              //                         4, // How much the shadow should be blurred
                              //                   ),
                              //                 ],
                              //                 color: Color.fromRGBO(
                              //                     220, 229, 239, 1),
                              //                 borderRadius:
                              //                     BorderRadius.circular(5),
                              //               ),
                              //               child: svgAsset(
                              //                 'lib/assets/am_scan.svg',
                              //               ),
                              //             ),
                              //             Padding(
                              //               padding:
                              //                   const EdgeInsets.only(left: 15.0),
                              //               child: Column(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment.center,
                              //                 crossAxisAlignment:
                              //                     CrossAxisAlignment.start,
                              //                 children: [
                              //                   Container(
                              //                     margin: EdgeInsets.only(),
                              //                     child: w600_17(
                              // context,
                              //                         'Bank Account', blackColor),
                              //                   ),
                              //                   Container(
                              //                     margin: EdgeInsets.only(),
                              //                     child:  w400_12(
                              // context,
                              //                         'Add bank details',
                              //                         blackColor),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //         Icon(Icons.keyboard_arrow_down_rounded),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              GestureDetector(
                                onTap: () {
                                  openBottomSheet();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromRGBO(4, 140, 252, 00.05),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Transform.scale(
                                            scale: 0.7,
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Image.asset(
                                                selectedBankNamessss,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
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
                              Container(
                                padding: const EdgeInsets.all(1.0),
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'email is required';
                                    }
                                    return null;
                                  },
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(51, 51, 51, 1),
                                      fontSize: 25),
                                  cursorColor: secondaryColor,
                                  keyboardType: TextInputType.number,
                                  controller: _bankAccountController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 10,
                                      top: 20,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    // prefixIcon: Container(
                                    //   width: screenSize.width * 0.03,
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.center,
                                    //     children: [
                                    //       svgAsset(
                                    //         'lib/assets/uim_master-card.svg',
                                    //       ),
                                    //       Text('4123'),
                                    //       Text('|'),
                                    //     ],
                                    //   ),
                                    // ),
                                    label: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Bank Account  '),
                                        Icon(
                                          Icons.star,
                                          color: Colors.red,
                                          size: 7,
                                        )
                                      ],
                                    ),
                                    // labelText: 'Phone number',
                                    labelStyle: GoogleFonts.quicksand(
                                        color: Colors.black),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: 'Enter your bank account',
                                    hintStyle: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(51, 51, 51, 0.4),
                                        fontSize: 13),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: textFieldBorderColor),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: textFieldBorderColor),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: textFieldBorderColor),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageTransition(
                                        child: TopUpDebitCardScreen(
                                          bankImage: selectedBankNamessss,
                                          bankAccountDetails01:
                                              _bankAccountController.text,
                                        ),
                                        type: PageTransitionType.leftToRight
                                        // duration: Duration(seconds: 1),
                                        ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: screenSize.height * 0.38,
                                    bottom: screenSize.height * 0.2,
                                  ),
                                  child: Container(
                                    height: screenSize.height * 0.05,
                                    width: screenSize.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: secondaryColor,
                                    ),
                                    child: Center(
                                      child: w500_17(
                                          context, 'Confirm', whiteColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
