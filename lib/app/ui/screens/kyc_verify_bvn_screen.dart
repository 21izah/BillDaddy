import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';
import 'kyc_face_verification_screen.dart';

class KycVerifyBvnScreen extends StatefulWidget {
  const KycVerifyBvnScreen({super.key});

  @override
  State<KycVerifyBvnScreen> createState() => _KycVerifyBvnScreenState();
}

class _KycVerifyBvnScreenState extends State<KycVerifyBvnScreen> {
  final _bvnController = TextEditingController();
  @override
  void dispose() {
    _bvnController.dispose();

    super.dispose();
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
                        'Enter your 11-digiti BVN',
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
                        'Bank Verification No',
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
                    controller: _bvnController,
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
                          Text('Enter BVN'),
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
