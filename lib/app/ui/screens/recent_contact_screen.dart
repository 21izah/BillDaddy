import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';
import 'transfer/transfer_to_egoFinace_screen.dart';

class RecentContactScreen extends StatefulWidget {
  const RecentContactScreen({super.key});

  @override
  State<RecentContactScreen> createState() => _RecentContactScreenState();
}

class _RecentContactScreenState extends State<RecentContactScreen> {
  List<Map<String, dynamic>> _contacts = [
    {
      'name': 'Mike Osinachim',
      'phoneNumber': '245025255225',
    },
    {
      'name': 'Jude Osinachim',
      'phoneNumber': '462562726466',
    },
    {
      'name': 'Chichi Osinachim',
      'phoneNumber': '4426623626',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TransferToEgofinaceScreen(
                              name: _contacts[index]['name'],
                              accountNumber: _contacts[index]['phoneNumber'],
                              walletId: _contacts[index]['name'][0],
                            )),
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
                  _contacts[index]['phoneNumber'],
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
