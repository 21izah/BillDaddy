import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';

class InvestScreen03 extends StatefulWidget {
  const InvestScreen03({super.key});

  @override
  State<InvestScreen03> createState() => _InvestScreen03State();
}

class _InvestScreen03State extends State<InvestScreen03> {
  bool isReadMore = false;

  String text =
      "Alphabet Inc. is an American multinational technology conglomerate holding company headquartered in Mountain View, California. Alphabet is the world's third-largest technology company by revenue and one of the world's most valuable companies. Ut eu in irure sunt laborum Lorem nostrud pariatur sint qui amet et reprehenderit reprehenderit. Laborum commodo proident proident aliquip laboris aliquip veniam qui deserunt consequat veniam occaecat ut. Enim ut consequat qui ullamco minim eu amet aliqua cillum minim excepteur. Reprehenderit fugiat mollit consectetur enim laboris amet reprehenderit non irure dolore culpa deserunt.";
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    dynamic maxLines = isReadMore ? null : 4;
    final overflow = isReadMore ? TextOverflow.visible : TextOverflow.ellipsis;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        centerTitle: false,
        title: w600_17(
          context,
          'Google Investment',
          blackColor,
        ),
        backgroundColor: whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                svgAsset(
                  'lib/assets/in_google.svg',
                ),
                w700_24(
                  context,
                  '\$180.08',
                  blackColor,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 4),
              width: screenSize.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: w700_17_02(
                      context,
                      'Alphabet Inc. - Class G Shares',
                      Color.fromRGBO(51, 51, 51, 0.7),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                w500_14(
                  context,
                  '(+1.98) +1.76% ',
                  secondaryColor,
                ),
                w500_14(
                  context,
                  'Today',
                  blackColor,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    // Wrap with Expanded to allow multiline wrapping
                    child: w600_17_02(
                      context,
                      'About Alphabet Inc. - Class G Shares (GOOG)',
                      blackColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: w400_14_mo(
                        context, text, blackColor, maxLines, overflow),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isReadMore = !isReadMore;
                      });
                    },
                    child: w500_14(
                      context,
                      isReadMore ? 'Read Less' : 'Read More',
                      secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  w400_14(
                    context,
                    'CEO',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    'Sundar Pichai',
                    blackColor,
                  ),
                ],
              ),
            ),
            Divider(color: textFieldBorderColor),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  w500_14(
                    context,
                    'Stats',
                    blackColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  w400_14(
                    context,
                    'Open',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    '141.05',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    'Volume',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    '47.78 M',
                    blackColor,
                  ),
                ],
              ),
            ),
            Divider(color: textFieldBorderColor),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  w400_14(
                    context,
                    'High',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    '141.05',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    'Avg Vol',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    '18.78 M',
                    blackColor,
                  ),
                ],
              ),
            ),
            Divider(color: textFieldBorderColor),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  w400_14(
                    context,
                    'Low',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    '125.05',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    'Mkt Cop',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    '1.78 T',
                    blackColor,
                  ),
                ],
              ),
            ),
            Divider(color: textFieldBorderColor),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  w400_14(
                    context,
                    '48 Wk High',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    '176.05',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    'P/E Ratio',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    '28.78',
                    blackColor,
                  ),
                ],
              ),
            ),
            Divider(color: textFieldBorderColor),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  w400_14(
                    context,
                    '48 Wk Low',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    '98.05',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    'Div/Yield',
                    blackColor,
                  ),
                  w400_14(
                    context,
                    '0.70',
                    blackColor,
                  ),
                ],
              ),
            ),
            Divider(color: textFieldBorderColor),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   PageTransition(
                //     child: Bottomnavigation(
                //       initialIndex: 4, // Main index
                //       initialSubIndex:
                //           31, // Sub-index for MeScreen (SettingsScreen)
                //     ),
                //     type: PageTransitionType.leftToRight
                //     duration: Duration(seconds: 1),
                //   ),
                // );
              },
              child: Padding(
                padding: EdgeInsets.only(
                  top: isReadMore
                      ? screenSize.height * 0.01
                      : screenSize.height * 0.1,
                  bottom: screenSize.height * 0.02,
                ),
                child: Container(
                  height: screenSize.height * 0.06,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: secondaryColor),
                  child: Center(
                      child: w500_17(context, 'Get Started', whiteColor)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
