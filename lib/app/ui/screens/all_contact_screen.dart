import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';
import 'request_money_screen.dart';

class AllContactScreen extends StatefulWidget {
  const AllContactScreen({super.key});

  @override
  State<AllContactScreen> createState() => _AllContactScreenState();
}

class _AllContactScreenState extends State<AllContactScreen> {
  List<Map<String, dynamic>> _contacts = [
    {
      'name': 'Jerry Osinachim',
      'phoneNumber': '245025255225',
    },
    {
      'name': 'Mike Osinachim',
      'phoneNumber': '462562726466',
    },
    {
      'name': 'Jude Osinachim',
      'phoneNumber': '4t26623626',
    },
    {
      'name': 'Felix Osinachim',
      'phoneNumber': '24452553523',
    },
    {
      'name': 'Chidi Osinachim',
      'phoneNumber': '25235252753',
    },
    {
      'name': 'Azeez Osinachim',
      'phoneNumber': '364758254255',
    },
    {
      'name': 'Kelly Osinachim',
      'phoneNumber': '24354534646',
    },
    {
      'name': 'Barry Osinachim',
      'phoneNumber': '982446234',
    },
    {
      'name': 'Joy Osinachim',
      'phoneNumber': '72424828292',
    },
    {
      'name': 'Caleb Osinachim',
      'phoneNumber': '2452482420',
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
          height: screenSize.height * 0.8,
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
                        builder: (context) => RequestMoneyScreen(
                              name: _contacts[index]['name'],
                              phoneNumber: _contacts[index]['phoneNumber'],
                              nameInitial: _contacts[index]['name'][0],
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
