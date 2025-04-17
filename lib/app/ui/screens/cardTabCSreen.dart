import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';
import 'cards_screen.dart';
import 'physical_card_screen.dart';

class Cardtabcsreen extends StatefulWidget {
  const Cardtabcsreen({super.key});

  @override
  State<Cardtabcsreen> createState() => _CardtabcsreenState();
}

class _CardtabcsreenState extends State<Cardtabcsreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          leadingWidth: 150,
          leading: Padding(
            padding: EdgeInsets.only(
              left: screenSize.width * 0.05,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 0.0,
                  ),
                  child: w500_24(context, 'Card', blackColor),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            TabBar(
              dividerHeight: 0,
              indicatorColor: blackColor,
              tabs: [
                Tab(
                  child: Text(
                    'Virtual Card',
                    style: TextStyle(color: blackColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'Physical Card',
                    style: TextStyle(color: blackColor),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                CardsScreen(),
                PhysicalCardScreen(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
