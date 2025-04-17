import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';

class FavoritesScreen03 extends StatefulWidget {
  const FavoritesScreen03({super.key});

  @override
  State<FavoritesScreen03> createState() => _FavoritesScreen03State();
}

class _FavoritesScreen03State extends State<FavoritesScreen03> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background02,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 20),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          height: screenSize.height * 0.4,
          width: double.infinity,
          color: Colors.white,
          child: ListView(
            children: [
              Container(
                height: screenSize.height * 0.2,
                width: screenSize.width,
                child: Image.asset(
                  'lib/assets/Empty_favoritePic.png',
                  fit: BoxFit.contain,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  w400_14(
                      context,
                      'No favorites yet, you can add a beneficiary to',
                      blackColor),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  w400_14(context, ' your Favourites’ list.', blackColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
