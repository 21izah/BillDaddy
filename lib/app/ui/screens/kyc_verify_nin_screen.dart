import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';
import 'kyc_face_verification_screen.dart';

class KycVerifyNinScreen extends StatefulWidget {
  const KycVerifyNinScreen({super.key});

  @override
  State<KycVerifyNinScreen> createState() => _KycVerifyNinScreenState();
}

class _KycVerifyNinScreenState extends State<KycVerifyNinScreen> {
  final _ninController = TextEditingController();
  @override
  void dispose() {
    _ninController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    // TODO:  check if user has nin
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            '',
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [
                  w700_24(context, 'Verify your BVN', blackColor)
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: [
                      w400_14(
                        context,
                        'Enter your 11-digiti NIN',
                        Color.fromRGBO(143, 154, 160, 1),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      w400_14(
                        context,
                        'National ID No',
                        Color.fromRGBO(143, 154, 160, 1),
                      ),
                    ],
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
                    controller: _ninController,
                    validator: (value) =>
                        value!.isEmpty ? 'BVN is required' : null,
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
                          Text('Enter NIN'),
                        ],
                      ),

                      labelStyle: buttonText04Style(cardRadialColor01),
                      floatingLabelBehavior: FloatingLabelBehavior.never,

                      filled: true,
                      fillColor: whiteColor,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(5),
                      ),

                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(248, 248, 248, 1),
                    border: Border.all(
                      color: Color.fromRGBO(223, 226, 228, 1),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Color.fromRGBO(255, 203, 5, 1),
                            ),
                            child: Center(
                              child: svgAsset(
                                'lib/assets/exclamation.svg',
                              ),
                            ),
                          ),
                          Container(
                            width: screenSize.width * 0.6,
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                w400_14(
                                  context,
                                  'Dial *342# on your phone number to receive your NIN.',
                                  Color.fromRGBO(51, 51, 51, 1),
                                ),
                                // w400_14(
                                //   context,
                                //   '',
                                //   Color.fromRGBO(51, 51, 51, 1),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                w400_14(
                                  context,
                                  'Service Fee: 50 ',
                                  Color.fromRGBO(51, 51, 51, 1),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                w400_14(
                                  context,
                                  'NGN',
                                  Color.fromRGBO(5, 71, 138, 1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const KycFaceVerificationScreen()),
                    );
                  },
                  child: Container(
                    height: screenSize.height * 0.06,
                    width: screenSize.width,
                    margin: EdgeInsets.only(top: screenSize.height * 0.15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: secondaryColor,
                    ),
                    child: Center(
                      child: w500_17(context, 'Next', whiteColor),
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
