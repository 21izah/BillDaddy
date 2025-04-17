import 'package:billdaddy/app/ui/screens/dashboard_screen.dart';
import 'package:billdaddy/app/utils/constants/nav_ids.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/screens/reward_screen.dart';

class Dashboard02 extends StatelessWidget {
  const Dashboard02({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.home),
      onGenerateRoute: (settings) {
        if (settings.name == '/home/reward') {
          return GetPageRoute(
            settings: settings,
            page: () => const RewardScreen(),
            // page: () => const DashboardScreen(),
          );
        } else {
          return GetPageRoute(
            settings: settings,
            page: () => const DashboardScreen(),
          );
        }
      },
    );
  }
}
