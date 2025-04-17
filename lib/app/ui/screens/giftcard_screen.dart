import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'bottomNavigation.dart';
import 'giftcard_screen02.dart';

class GiftcardScreen extends StatefulWidget {
  const GiftcardScreen({super.key});

  @override
  State<GiftcardScreen> createState() => _GiftcardScreenState();
}

class _GiftcardScreenState extends State<GiftcardScreen> {
  final _searchController = TextEditingController();

  List<Map<String, dynamic>> internetCompanies = [
    {
      'name': 'Nigeria (International)',
      'imagePath': 'lib/assets/nigeria003.png',
    },
    {
      'name': 'Nigeria (Local)',
      'imagePath': 'lib/assets/nigeria003.png',
    },
    {
      'name': 'United States',
      'imagePath': 'lib/assets/unitedSates02.png',
    },
    {
      'name': 'Algeria',
      'imagePath': 'lib/assets/algeria.png',
    },
    {
      'name': 'Turkey',
      'imagePath': 'lib/assets/turkey.png',
    },
    {
      'name': 'China',
      'imagePath': 'lib/assets/china01.png',
    },
    {
      'name': 'Italy',
      'imagePath': 'lib/assets/italy01.png',
    },
    {
      'name': 'Germany',
      'imagePath': 'lib/assets/germany01.png',
    },
  ];
  List<bool> isCheckedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<Map<String, dynamic>> _filteredCompanies = [];
  @override
  void initState() {
    super.initState();
    // Add listeners to text controllers to call _updateButtonState whenever text changes

    _filteredCompanies = internetCompanies;
  }

  void runFilter(String enterKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty) {
      results = internetCompanies;
    } else {
      results = internetCompanies
          .where((user) =>
              user['name']!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredCompanies = results;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
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
                      // Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: w600_17(context, 'Buy GiftCard', blackColor),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: w600_17(context, 'History', blackColor),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                margin: EdgeInsets.all(20),
                height: screenSize.height,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      // padding: const EdgeInsets.all(1.0),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
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
                                color: secondaryColor,
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
                              Text('Search Countries'),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          w400_14(
                            context,
                            'Select your preferred country 🙂',
                            blackColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: screenSize.height * 0.6,
                      width: screenSize.width,
                      child: ListView.builder(
                        itemCount: _filteredCompanies.length,
                        itemBuilder: (context, index) {
                          final company = _filteredCompanies[index];
                          return Column(
                            children: [
                              buildContriesContainer(
                                index: index,
                                imagePath: company['imagePath']!,
                                currencyName: company['name']!,
                                screenSize: screenSize,
                                setState: setState,
                              ),
                              Divider(color: textFieldBorderColor),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildContriesContainer({
    required int index,
    required String imagePath,
    required String currencyName,
    required Size screenSize,
    required StateSetter setState,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (int i = 0; i < isCheckedList.length; i++) {
            isCheckedList[i] = (i == index);
          }
        });
        Navigator.of(context).push(
          PageTransition(
            child: GiftcardScreen02(),
            type: PageTransitionType.leftToRight,
            // duration: Duration(seconds: 1),
          ),
        );
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              w400_14(
                                context,
                                currencyName,
                                blackColor,
                              ),
                            ],
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
