import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/scroll_controller.dart';
import '../../utils/constants/data_constant.dart';
import 'bottomNavigation.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  bool isAllCategoriesNotVisible = true;
  bool isAllNotVisible = true;
  List<Map<String, dynamic>> allTransactions = [
    {
      'name': 'Waliyilahi, Juliet Thomas',
      'date': '10 Aug, 11:00AM',
      'transaction_status': 'Successful',
      'transaction_type': 'Debit',
      'amount': '-₦12,000.00',
      'iamgePath': 'lib/assets/card-sendcard.svg',
    },
    {
      'name': 'Joyce Williams, Waliyilahi',
      'date': '10 Aug, 11:00AM',
      'transaction_status': 'Successful',
      'transaction_type': 'Credit',
      'amount': '+₦24,000.00',
      'iamgePath': 'lib/assets/card-sendcard.svg',
    },
    {
      'name': 'Airtime (MTN Ng)',
      'date': '10 Aug, 11:00AM',
      'transaction_status': 'Successful',
      'transaction_type': 'Debit',
      'amount': '-₦  2,000.00',
      'iamgePath': 'lib/assets/airtimeAutoSave.svg',
    },
    // {
    //   'name': 'Airtime (MTN Ng)',
    //   'date': '10 Aug, 11:00AM',
    //   'transaction_status': 'Successful',
    //   'transaction_type': 'Debit',
    //   'amount': '-₦  12,000.00',
    //   'iamgePath': 'lib/assets/airtimeAutoSave.svg',
    // },
    // {
    //   'name': 'Waliyilahi, Juliet Thomas',
    //   'date': '10 Aug, 11:00AM',
    //   'transaction_status': 'Successful',
    //   'transaction_type': 'Debit',
    //   'amount': '-₦  12,000.00',
    //   'iamgePath': 'lib/assets/card-sendcard.svg',
    // },
    // {
    //   'name': 'Waliyilahi, Juliet Thomas',
    //   'date': '10 Aug, 11:00AM',
    //   'transaction_status': 'Successful',
    //   'transaction_type': 'Debit',
    //   'amount': '-₦  12,000.00',
    //   'iamgePath': 'lib/assets/card-sendcard.svg',
    // },
    // {
    //   'name': 'Waliyilahi, Juliet Thomas',
    //   'date': '10 Aug, 11:00AM',
    //   'transaction_status': 'Successful',
    //   'transaction_type': 'Debit',
    //   'amount': '-₦  12,000.00',
    //   'iamgePath': 'lib/assets/card-sendcard.svg',
    // },
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // final scrollController = ref.read(scrollControllerProvider);
    // final ScrollController scrollController = Get.put(ScrollController());
    return Scaffold(
      backgroundColor: background02,
      appBar: AppBar(
        leadingWidth: 200,
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
                  child: w600_20(context, 'Transactions', blackColor),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Transform.scale(
            scale: 0.9,
            child: Container(
              child: Image.asset('lib/assets/TH_doughnutChart.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 3),
            child: w400_14(
              context,
              'Statistics',
              blackColor,
            ),
          ),
        ],
        // centerTitle: false,
        // title: w600_17(
        //   context,
        //   'Transactions',
        //   blackColor,
        // ),
        backgroundColor: whiteColor,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                  color: whiteColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isAllCategoriesNotVisible =
                                    !isAllCategoriesNotVisible;
                                isAllNotVisible = true;
                              });
                            },
                            child: Row(
                              children: [
                                w400_17(
                                  context,
                                  'All Categories',
                                  blackColor,
                                ),
                                isAllCategoriesNotVisible
                                    ? Icon(Icons.arrow_drop_down_rounded)
                                    : Icon(Icons.arrow_drop_up_rounded)
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isAllNotVisible = !isAllNotVisible;
                                isAllCategoriesNotVisible = true;
                              });
                            },
                            child: Row(
                              children: [
                                w400_17(
                                  context,
                                  'All',
                                  blackColor,
                                ),
                                isAllNotVisible
                                    ? Icon(Icons.arrow_drop_down_rounded)
                                    : Icon(Icons.arrow_drop_up_rounded)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height,
                  child: ListView(
                    // controller: scrollController,
                    children: [
                      Stack(
                        children: [
                          //
                          Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      color: whiteColor,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 10, 20, 10),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    w400_17(context, 'Jan',
                                                        blackColor),
                                                    Icon(Icons
                                                        .arrow_drop_down_rounded),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0,
                                                          bottom: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      w400_17(
                                                          context,
                                                          'In: ₦ 85,000.00',
                                                          blackColor),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20),
                                                        child: w400_17(
                                                            context,
                                                            'Out: ₦ 5,000.00',
                                                            blackColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // The ListView.builder with dynamic height
                                          Container(
                                            child: ListView.builder(
                                              shrinkWrap:
                                                  true, // This ensures it takes the height of its content

                                              itemCount: allTransactions.length,
                                              itemBuilder: (context, index) {
                                                final transactionDetail =
                                                    allTransactions[index];
                                                return Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 10, 0, 10),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 20.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            4,
                                                                            140,
                                                                            252,
                                                                            1),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.2),
                                                                        blurRadius:
                                                                            10,
                                                                        offset: Offset(
                                                                            0,
                                                                            -5),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: svgAsset(
                                                                      '${transactionDetail['iamgePath']}'),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              8.0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      w500_12(
                                                                          context,
                                                                          '${transactionDetail['name']}',
                                                                          blackColor),
                                                                      w500_12(
                                                                          context,
                                                                          '${transactionDetail['date']}',
                                                                          blackColor),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                w500_12(
                                                                    context,
                                                                    '${transactionDetail['transaction_type']}',
                                                                    secondaryColor),
                                                                w500_12(
                                                                    context,
                                                                    '${transactionDetail['amount']}',
                                                                    blackColor),
                                                                w500_12(
                                                                    context,
                                                                    '${transactionDetail['transaction_status']}',
                                                                    secondaryColor),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        color:
                                                            textFieldBorderColor,
                                                        thickness: 1,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      color: whiteColor,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 10, 20, 10),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    w400_17(context, 'Oct 2023',
                                                        blackColor),
                                                    Icon(Icons
                                                        .arrow_drop_down_rounded),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0,
                                                          bottom: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      w400_17(
                                                          context,
                                                          'In: ₦ 185,000.00',
                                                          blackColor),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20),
                                                        child: w400_17(
                                                            context,
                                                            'Out: ₦ 5,000.00',
                                                            blackColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // The ListView.builder with dynamic height
                                          Container(
                                            child: ListView.builder(
                                              shrinkWrap:
                                                  true, // This ensures it takes the height of its content

                                              itemCount: allTransactions.length,
                                              itemBuilder: (context, index) {
                                                final transactionDetail =
                                                    allTransactions[index];
                                                return Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 10, 0, 10),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 20.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            4,
                                                                            140,
                                                                            252,
                                                                            1),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.2),
                                                                        blurRadius:
                                                                            10,
                                                                        offset: Offset(
                                                                            0,
                                                                            -5),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: svgAsset(
                                                                      '${transactionDetail['iamgePath']}'),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              8.0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      w500_12(
                                                                          context,
                                                                          '${transactionDetail['name']}',
                                                                          blackColor),
                                                                      w500_12(
                                                                          context,
                                                                          '${transactionDetail['date']}',
                                                                          blackColor),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                w500_12(
                                                                    context,
                                                                    '${transactionDetail['transaction_type']}',
                                                                    secondaryColor),
                                                                w500_12(
                                                                    context,
                                                                    '${transactionDetail['amount']}',
                                                                    blackColor),
                                                                w500_12(
                                                                    context,
                                                                    '${transactionDetail['transaction_status']}',
                                                                    secondaryColor),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        color:
                                                            textFieldBorderColor,
                                                        thickness: 1,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /// end
                              ///start
                              // Container(
                              //   height: screenSize.height * 0.4,
                              //   child: Column(
                              //     children: [
                              //       Container(
                              //         height: screenSize.height * 0.45,
                              //         child: Container(
                              //           margin: EdgeInsets.only(top: 10, bottom: 10),
                              //           color: whiteColor,
                              //           child: Column(
                              //             children: [
                              //               Container(
                              //                 margin:
                              //                     EdgeInsets.fromLTRB(20, 10, 20, 10),
                              //                 child: Column(
                              //                   children: [
                              //                     Row(
                              //                       children: [
                              //                         w400_17(
                              // context,
                              //                           'Dec 2023',
                              //                           blackColor,
                              //                         ),
                              //                         Icon(
                              //                             Icons.arrow_drop_down_rounded)
                              //                       ],
                              //                     ),
                              //                     Padding(
                              //                       padding: const EdgeInsets.only(
                              //                           top: 10.0, bottom: 10),
                              //                       child: Row(
                              //                         mainAxisAlignment:
                              //                             MainAxisAlignment.start,
                              //                         children: [
                              //                           Row(
                              //                             children: [
                              //                               w400_17(
                              // context,
                              //                                 'In: ₦ 100,850,000.00',
                              //                                 blackColor,
                              //                               ),
                              //                             ],
                              //                           ),
                              //                           Padding(
                              //                             padding: EdgeInsets.only(
                              //                                 left: screenSize.width *
                              //                                     0.15),
                              //                             child: Row(
                              //                               children: [
                              //                                 w400_17(
                              // context,
                              //                                   'Out: ₦ 5,000.00',
                              //                                   blackColor,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //                   ],
                              //                 ),
                              //               ),
                              //               Container(
                              //                 height: screenSize.height * 0.3,
                              //                 child: ListView.builder(
                              //                   itemCount: allTransactions.length,
                              //                   itemBuilder: (context, index) {
                              //                     final transactionDetail =
                              //                         allTransactions[index];
                              //                     return Container(
                              //                       // color: secondaryColor,
                              //                       padding: EdgeInsets.fromLTRB(
                              //                           0, 10, 0, 10),
                              //                       margin: EdgeInsets.only(
                              //                           bottom: 0,
                              //                           top: 0,
                              //                           left: 20,
                              //                           right: 20),
                              //                       child: Column(
                              //                         children: [
                              //                           Padding(
                              //                             padding:
                              //                                 const EdgeInsets.only(
                              //                                     bottom: 20.0),
                              //                             child: Row(
                              //                               mainAxisAlignment:
                              //                                   MainAxisAlignment
                              //                                       .spaceBetween,
                              //                               children: [
                              //                                 Row(
                              //                                   children: [
                              //                                     Container(
                              //                                       padding: EdgeInsets
                              //                                           .fromLTRB(10,
                              //                                               10, 10, 10),
                              //                                       decoration:
                              //                                           BoxDecoration(
                              //                                         color: Color
                              //                                             .fromRGBO(
                              //                                                 4,
                              //                                                 140,
                              //                                                 252,
                              //                                                 1),
                              //                                         borderRadius:
                              //                                             BorderRadius
                              //                                                 .circular(
                              //                                                     10),
                              //                                         boxShadow: [
                              //                                           BoxShadow(
                              //                                             color: Colors
                              //                                                 .black
                              //                                                 .withOpacity(
                              //                                                     0.2),
                              //                                             blurRadius:
                              //                                                 10,
                              //                                             offset:
                              //                                                 Offset(0,
                              //                                                     -5),
                              //                                           ),
                              //                                         ],
                              //                                       ),
                              //                                       child: svgAsset(
                              //                                         '${transactionDetail['iamgePath']}',
                              //                                       ),
                              //                                     ),
                              //                                     Padding(
                              //                                       padding:
                              //                                           const EdgeInsets
                              //                                               .only(
                              //                                               left: 8.0),
                              //                                       child: Column(
                              //                                         crossAxisAlignment:
                              //                                             CrossAxisAlignment
                              //                                                 .start,
                              //                                         children: [
                              //                                           w500_12(
                              // context,
                              //                                             '${transactionDetail['name']}',
                              //                                             blackColor,
                              //                                           ),
                              //                                           w500_12(
                              // context,
                              //                                             '${transactionDetail['date']}',
                              //                                             blackColor,
                              //                                           ),
                              //                                         ],
                              //                                       ),
                              //                                     ),
                              //                                   ],
                              //                                 ),
                              //                                 // Row(
                              //                                 //   mainAxisAlignment:
                              //                                 //       MainAxisAlignment
                              //                                 //           .center,
                              //                                 //   crossAxisAlignment:
                              //                                 //       CrossAxisAlignment
                              //                                 //           .end,
                              //                                 //   children: [
                              //                                 //     Padding(
                              //                                 //       padding:
                              //                                 //           const EdgeInsets
                              //                                 //               .only(
                              //                                 //               bottom:
                              //                                 //                   0.0),
                              //                                 //       child:
                              //                                 //           w500_12(
                              // context,
                              //                                 //         '${transactionDetail['transaction_status']}',
                              //                                 //         secondaryColor,
                              //                                 //       ),
                              //                                 //     ),
                              //                                 //   ],
                              //                                 // ),
                              //                                 Row(
                              //                                   children: [
                              //                                     Column(
                              //                                       mainAxisAlignment:
                              //                                           MainAxisAlignment
                              //                                               .end,
                              //                                       crossAxisAlignment:
                              //                                           CrossAxisAlignment
                              //                                               .end,
                              //                                       children: [
                              //                                         w500_12(
                              // context,
                              //                                           '${transactionDetail['transaction_type']}',
                              //                                           secondaryColor,
                              //                                         ),
                              //                                         w500_12(
                              // context,
                              //                                           '${transactionDetail['amount']}',
                              //                                           blackColor,
                              //                                         ),
                              //                                         w500_12(
                              // context,
                              //                                           '${transactionDetail['transaction_status']}',
                              //                                           secondaryColor,
                              //                                         ),
                              //                                       ],
                              //                                     )
                              //                                   ],
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                           ),
                              //                           Divider(
                              //                             color: textFieldBorderColor,
                              //                             thickness: 1,
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     );
                              //                   },
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                          isAllCategoriesNotVisible
                              ? Container()
                              : Container(
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.only(top: 10),
                                  height: screenSize.height * 0.3,
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Wrap(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(context, 'Bank Deposit',
                                            whiteColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(context, 'Transfer from',
                                            whiteColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(
                                            context, 'Transfer to', whiteColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(
                                            context, 'Airtime', whiteColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(
                                            context, 'Mobile Data', whiteColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(
                                            context, 'Betting', whiteColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(
                                            context, 'Add Money', whiteColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(
                                            context, 'Electricity', whiteColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child:
                                            w400_12(context, 'TV', whiteColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(
                                            context, 'Reversal', whiteColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(context, 'Cash Withdraw',
                                            whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                          isAllNotVisible
                              ? Container()
                              : Container(
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.only(top: 10),
                                  height: screenSize.height * 0.2,
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Wrap(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(
                                            context, 'All Status', whiteColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(
                                            context, 'Successful', whiteColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(
                                            context, 'Pending', whiteColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(
                                            context, 'Failed', whiteColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: w400_12(
                                            context, 'Reversed', whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
