import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';
import 'kyc_face_verification02_screen.dart';

class KycFaceVerificationScreen extends StatefulWidget {
  const KycFaceVerificationScreen({super.key});

  @override
  State<KycFaceVerificationScreen> createState() =>
      _KycFaceVerificationScreenState();
}

class _KycFaceVerificationScreenState extends State<KycFaceVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Container(
                      child: Image.asset(
                        'lib/assets/kyc_facescan.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                w700_24(context, 'Face Verification', blackColor)
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      // This ensures the text wraps properly
                      child: RichText(
                        textAlign: TextAlign.center, // Center-aligns the text
                        text: TextSpan(
                          style: w400_14_s(context, blackColor),
                          children: [
                            TextSpan(
                              text:
                                  'Your face needs to be verified against your NIN',
                              style: w400_14_s(
                                context,
                                Color.fromRGBO(143, 154, 160, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     // Padding(
              //     //   padding: const EdgeInsets.only(left: 20.0, right: 20),
              //     //   child: Row(
              //     //     mainAxisAlignment: MainAxisAlignment.center,
              //     //     children: [
              //     //       Flexible(
              //     //         // This ensures the text wraps properly
              //     //         child: RichText(
              //     //           textAlign:
              //     //               TextAlign.center, // Center-aligns the text
              //     //           text: TextSpan(
              //     //             style: w400_14_s(context, blackColor),
              //     //             children: [
              //     //               TextSpan(
              //     //                 text:
              //     //                     'Your face needs to be verified against your NIN',
              //     //                 style: w400_14_s(
              //     //                   context,
              //     //                   Color.fromRGBO(143, 154, 160, 1),
              //     //                 ),
              //     //               ),
              //     //             ],
              //     //           ),
              //     //         ),
              //     //       ),
              //     //     ],
              //     //   ),
              //     // ),
              //     w400_14_soft_wrap(
              //       context,
              //       'Your face needs to be verified against your NIN',
              //       Color.fromRGBO(143, 154, 160, 1),
              //     ),
              //   ],
              // ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: screenSize.height * 0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(248, 248, 248, 1),
                  border: Border.all(
                    color: Color.fromRGBO(223, 226, 228, 1),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: screenSize.height * 0.02, left: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          w400_14(
                            context,
                            'Recommendations',
                            blackColor,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  height: 20,
                                  width: 20,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'lib/assets/kyc_recommendaton02.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                w400_12(
                                  context,
                                  'Stay in a brightly lit environment',
                                  Color.fromRGBO(51, 51, 51, 1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8),
                            height: 20,
                            width: 20,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Color.fromRGBO(217, 217, 217, 1),
                            ),
                            child: Center(
                              child: Image.asset(
                                'lib/assets/kyc_recommendation.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          w400_12(
                            context,
                            'Remove any face coverings',
                            Color.fromRGBO(51, 51, 51, 1),
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
                            const KycFaceVerification02Screen()),
                  );
                },
                child: Container(
                  height: screenSize.height * 0.06,
                  width: screenSize.width,
                  margin: EdgeInsets.only(top: screenSize.height * 0.15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondaryColor,
                  ),
                  child: Center(
                    child: w500_17(context, 'Proceed', whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
