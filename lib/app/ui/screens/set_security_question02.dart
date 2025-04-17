import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SetSecurityQuestion02 extends StatefulWidget {
  const SetSecurityQuestion02({super.key});

  @override
  State<SetSecurityQuestion02> createState() => _SetSecurityQuestion02State();
}

class _SetSecurityQuestion02State extends State<SetSecurityQuestion02> {
  final _answer01Controller = TextEditingController();
  final _answer02Controller = TextEditingController();
  @override
  void dispose() {
    _answer01Controller.dispose();
    _answer02Controller.dispose();

    super.dispose();
  }

  // List of security questions
  final List<String> _securityQuestions = [
    'What is your Mother’s first name?',
    'What is your Father’s first name?',
    'What is your Childhood name?',
    'What is your favorite food?',
    'Where were you born?',
  ];

  final List<String> _secondSecurityQuestions = [
    'What is your Favorite pet’s name??',
    'What is your Childhood name?',
    'What is your favorite food?',
    'Where were you born?',
  ];

  // Selected value for the dropdown
  String _selectedQuestion = 'Choose your first security question';
  String _selectedQuestion2 = 'Choose your 2nd security question';
  String? selectedValue;
  String? selectedValue02;
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
                      Get.offAllNamed('/setSecurityQuestion');
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child:
                        w600_17(context, 'Set security question', blackColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        // appBar: AppBar(
        //   centerTitle: false,
        //   title: w600_17(
        //     context,
        //     'Set security question',
        //     blackColor,
        //   ),
        //   backgroundColor: whiteColor,
        // ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: whiteColor)),
                  child: DropdownButton2(
                    iconStyleData: IconStyleData(
                      // icon: Icon(Icons.arrow_downward_outlined),
                      iconEnabledColor: blackColor,
                      iconDisabledColor: Colors.blue,
                    ),
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                    barrierColor: Colors.transparent,
                    underline: Container(),
                    hint: Text(
                      _selectedQuestion,
                      style: w400_11_s(context, blackColor),
                    ),
                    items: _securityQuestions
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: w400_11_s(context, blackColor),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedQuestion = newValue!;
                      });
                    },
                    // onChanged: (value) {
                    //   setState(() {
                    //     selectedValue = value as String;

                    //     if (selectedValue == 'My Profile') {
                    //       Navigator.of(context).push(PageTransition(
                    //         child: ,
                    //         type: PageTransitionType.rightToLeft,
                    //       ));
                    //     } else if (selectedValue == 'Bank Account') {
                    //       Navigator.of(context).push(PageTransition(
                    //         child: ,
                    //         type: PageTransitionType.rightToLeft,
                    //       ));
                    //     }
                    //   });
                    // },
                    dropdownStyleData: DropdownStyleData(
                      width: screenSize.width * 0.9,
                      offset: Offset(0, -5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    buttonStyleData: ButtonStyleData(
                        padding: const EdgeInsets.all(10),
                        height: screenSize.height * 0.07,
                        width: screenSize.width - 10,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        )),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
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
                    keyboardType: TextInputType.text,
                    controller: _answer01Controller,
                    validator: (value) =>
                        value!.isEmpty ? 'User ID is required' : null,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(
                      //   left: 15,
                      //   top: 20,
                      //   right: 10,
                      //   bottom: 20,
                      // ),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Max. (20 Characters)'),
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
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: whiteColor)),
                  child: DropdownButton2(
                    iconStyleData: IconStyleData(
                      // icon: Icon(Icons.arrow_downward_outlined),
                      iconEnabledColor: blackColor,
                      iconDisabledColor: Colors.blue,
                    ),
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                    barrierColor: Colors.transparent,
                    underline: Container(),
                    hint: Text(
                      _selectedQuestion2,
                      style: w400_11_s(context, blackColor),
                    ),
                    items: _secondSecurityQuestions
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: w400_11_s(context, blackColor),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedQuestion2 = newValue!;
                      });
                    },
                    // onChanged: (value) {
                    //   setState(() {
                    //     selectedValue = value as String;

                    //     if (selectedValue == 'My Profile') {
                    //       Navigator.of(context).push(PageTransition(
                    //         child: ,
                    //         type: PageTransitionType.rightToLeft,
                    //       ));
                    //     } else if (selectedValue == 'Bank Account') {
                    //       Navigator.of(context).push(PageTransition(
                    //         child: ,
                    //         type: PageTransitionType.rightToLeft,
                    //       ));
                    //     }
                    //   });
                    // },
                    dropdownStyleData: DropdownStyleData(
                      width: screenSize.width * 0.9,
                      offset: Offset(0, -5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    buttonStyleData: ButtonStyleData(
                        padding: const EdgeInsets.all(10),
                        height: screenSize.height * 0.07,
                        width: screenSize.width - 10,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        )),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
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
                    keyboardType: TextInputType.text,
                    controller: _answer02Controller,
                    validator: (value) =>
                        value!.isEmpty ? 'User ID is required' : null,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(
                      //   left: 15,
                      //   top: 20,
                      //   right: 10,
                      //   bottom: 20,
                      // ),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Max. (20 Characters)'),
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
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   PageTransition(
                    //     child: Bottomnavigation(
                    //       initialIndex: 4, // Main index
                    //       initialSubIndex:
                    //           8, // Sub-index for MeScreen (SettingsScreen)
                    //     ),
                    //     type: PageTransitionType.leftToRight
                    //     duration: Duration(seconds: 1),
                    //   ),
                    // );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.015,
                      left: 00,
                      right: 00,
                      bottom: screenSize.height * 0.02,
                    ),
                    child: Container(
                      height: screenSize.height * 0.06,
                      width: screenSize.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: secondaryColor),
                      child: Center(
                          child: w500_17(context, 'Confirm', whiteColor)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
