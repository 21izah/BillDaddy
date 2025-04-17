import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/screens/invest_screen.dart';
import '../../ui/screens/invest_screen02.dart';
import '../../utils/constants/nav_ids.dart';

class Invest03 extends StatelessWidget {
  const Invest03({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.invest),
      onGenerateRoute: (settings) {
        if (settings.name == '/invest/invest02') {
          return GetPageRoute(
            settings: settings,
            page: () => const InvestScreen02(),
            // page: () => const DashboardScreen(),
          );
        } else {
          return GetPageRoute(
            settings: settings,
            page: () => const InvestScreen(),
          );
        }
      },
    );
  }
}
