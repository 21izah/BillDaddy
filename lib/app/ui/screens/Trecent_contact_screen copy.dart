import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'transfer/transfer_to_other_bank_screen.dart';

class TrecentContactScreen extends StatefulWidget {
  const TrecentContactScreen({super.key});

  @override
  State<TrecentContactScreen> createState() => _TrecentContactScreenState();
}

class _TrecentContactScreenState extends State<TrecentContactScreen> {
  List<Map<String, dynamic>> _contacts = [
    {
      'name': 'Mike Osinachim',
      'bankAccount01': '245025255225',
      'bank': 'Access Bank',
    },
    {
      'name': 'Jude Osinachim',
      'bankAccount01': '462562726466',
      'bank': 'Diamond Bank',
    },
    {
      'name': 'Chichi Osinachim',
      'bankAccount01': '4426623626',
      'bank': 'Zenith Bank',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background02,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 20),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          height: screenSize.height * 0.3,
          width: double.infinity,
          color: Colors.white,
          child: ListView.builder(
            itemCount: _contacts.length,
            itemBuilder: (context, index) {
              print('${_contacts[index]['name'][0]}');
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    PageTransition(
                        child: TransferToOtherBankScreen(
                          bankCode: '123',
                          recepientName: 'farouk',
                          bankName: _contacts[index]['bank'],
                          bankAccount: _contacts[index]['bankAccount01'],
                          walletId: _contacts[index]['bankAccount01'],
                        ),
                        type: PageTransitionType.leftToRight
                        // duration: Duration(seconds: 1),
                        ),
                  );
                },
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.primaries[
                          Random().nextInt(Colors.primaries.length)]),
                  child: Center(
                      child: Text(
                    '${_contacts[index]['name'][0]}',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
                ),
                title: Text(
                  _contacts[index]['name'],
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                subtitle: Text(
                  _contacts[index]['bankAccount01'],
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
