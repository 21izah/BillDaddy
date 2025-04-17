import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';
import 'kyc_set_option_screen.dart';

class KycScreen extends StatefulWidget {
  const KycScreen({super.key});

  @override
  State<KycScreen> createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  final _searchController = TextEditingController();
  String _selectedCountry = 'Nigeria';
  String _selectedImage = 'lib/assets/nigeria003.png';
  List<Map<String, dynamic>> internetCompanies = [
    {'name': 'Nigeria', 'imagePath': 'lib/assets/nigeria003.png'},
    {'name': 'United States', 'imagePath': 'lib/assets/unitedSates02.png'},
    {'name': 'Algeria', 'imagePath': 'lib/assets/algeria.png'},
    {'name': 'Turkey', 'imagePath': 'lib/assets/turkey.png'},
    {'name': 'China', 'imagePath': 'lib/assets/china01.png'},
    {'name': 'Italy', 'imagePath': 'lib/assets/italy01.png'},
    {'name': 'Germany', 'imagePath': 'lib/assets/germany01.png'},
  ];

  List<bool> isCheckedList = [false, false, false, false, false, false, false];
  List<Map<String, dynamic>> _filteredCompanies = [];

  bool isVisible = true;

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      backgroundColor: Colors.white,
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
                    Get.offAllNamed('/me');
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(children: [w700_24(context, 'Your Nationality', blackColor)]),
              Row(children: [
                w400_14(
                  context,
                  'Select your country',
                  Color.fromRGBO(143, 154, 160, 1),
                ),
              ]),
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisible = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(248, 248, 248, 1),
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Color.fromRGBO(223, 226, 228, 1)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(_selectedImage),
                              radius: 7.5,
                            ),
                            SizedBox(width: 8),
                            w400_14(context, _selectedCountry, blackColor),
                          ]),
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(196, 229, 255, 1),
                              ),
                              child: w400_14(
                                context,
                                'Change',
                                Color.fromRGBO(5, 71, 138, 1),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                replacement: Column(
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
                    Container(
                      height: screenSize.height * 0.6,
                      child: ListView.builder(
                        itemCount: _filteredCompanies.length,
                        itemBuilder: (context, index) {
                          final company = _filteredCompanies[index];
                          return buildCountriesContainer(
                            index: index,
                            imagePath: company['imagePath']!,
                            currencyName: company['name']!,
                            screenSize: screenSize,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KycSetOptionScreen()),
                    );
                  },
                  child: Container(
                    height: screenSize.height * 0.06,
                    width: screenSize.width,
                    margin: EdgeInsets.only(top: screenSize.height * 0.25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: secondaryColor,
                    ),
                    child: Center(
                      child: w500_17(context, 'Next', whiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCountriesContainer({
    required int index,
    required String imagePath,
    required String currencyName,
    required Size screenSize,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (int i = 0; i < isCheckedList.length; i++) {
            isCheckedList[i] = (i == index);
          }
          _selectedCountry = currencyName;
          _selectedImage = imagePath;
          this.setState(() {});
          isVisible = true;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isCheckedList[index]
              ? Colors.blue.withOpacity(0.1)
              : Colors.transparent,
        ),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 20,
            ),
            SizedBox(width: 15),
            Text(currencyName),
          ],
        ),
      ),
    );
  }
}
