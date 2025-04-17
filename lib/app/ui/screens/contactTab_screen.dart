import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';
import 'all_contact_screen.dart';
import 'recent_contact_screen.dart';

class ContacttabScreen extends StatefulWidget {
  const ContacttabScreen({super.key});

  @override
  State<ContacttabScreen> createState() => _ContacttabScreenState();
}

class _ContacttabScreenState extends State<ContacttabScreen> {
  final _amountController = TextEditingController();
  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: background02,
        appBar: AppBar(
          centerTitle: false,
          title: w600_17(
            context,
            'Borrow Money',
            blackColor,
          ),
          backgroundColor: whiteColor,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 20, 0, 0),
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
                    w400_16(
                      context,
                      'Name / Phone Number',
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
                      value!.isEmpty ? 'Phone No./ Name is required' : null,
                  decoration: InputDecoration(
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Phone No./ Name'),
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
                      'All Contacts',
                      style: TextStyle(color: blackColor),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  RecentContactScreen(),
                  AllContactScreen(),
                  // CardsScreen(),
                  // PhysicalCardScreen(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
