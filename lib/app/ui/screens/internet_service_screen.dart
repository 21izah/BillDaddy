import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'bottomNavigation.dart';
import 'internet_service02_screen.dart';

class InternetServiceScreen extends StatefulWidget {
  const InternetServiceScreen({super.key});

  @override
  State<InternetServiceScreen> createState() => _InternetServiceScreenState();
}

class _InternetServiceScreenState extends State<InternetServiceScreen> {
  final _searchController = TextEditingController();

  List<Map<String, dynamic>> internetCompanies = [
    {
      'name': '9mobile Data_Bundles',
      'Subname': 'ETIDA',
      'imagePath': 'lib/assets/9mobile.png',
    },
    {
      'name': 'Spectranet Limited',
      'Subname': 'SPEC',
      'imagePath': 'lib/assets/spectranet.png',
    },
    {
      'name': 'Airtel CLEP',
      'Subname': 'CLEP',
      'imagePath': 'lib/assets/airtel002.png',
    },
    {
      'name': 'Smile Bundle',
      'Subname': 'SMILE',
      'imagePath': 'lib/assets/smile001.png',
    },
    {
      'name': 'Coollink',
      'Subname': 'CLK',
      'imagePath': 'lib/assets/coollink.png',
    },
    {
      'name': 'Internet Solutions Nigeria Ltd.',
      'Subname': 'ETIDA',
      'imagePath': 'lib/assets/ISN.png',
    },
    {
      'name': 'Airtel Roaming Bundles',
      'Subname': 'BAB',
      'imagePath': 'lib/assets/airtel002.png',
    },
  ];
  List<bool> isCheckedList = [false, false, false, false, false, false, false];
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
                    child: w600_17(context, 'Internet Services', blackColor),
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
                              Text('Search Company'),
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
                      height: screenSize.height * 0.7,
                      width: screenSize.width,
                      child: ListView.builder(
                        itemCount: _filteredCompanies.length,
                        itemBuilder: (context, index) {
                          final company = _filteredCompanies[index];
                          return Column(
                            children: [
                              buildInternetContainer(
                                index: index,
                                imagePath: company['imagePath']!,
                                currencyName: company['name']!,
                                currencyCode: company['Subname']!,
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

  Widget buildInternetContainer({
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
        });
        Navigator.of(context).push(
          PageTransition(
            child: InternetService02Screen(
              name: currencyName,
              Subname: currencyCode,
              imagePath: imagePath,
            ),
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
                              w400_14(
                                context,
                                currencyCode,
                                secondaryColor,
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
