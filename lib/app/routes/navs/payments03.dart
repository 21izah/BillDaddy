import 'package:billdaddy/app/utils/constants/nav_ids.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/screens/me_screen02.dart';

class Payments03 extends StatelessWidget {
  const Payments03({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.payment),
      onGenerateRoute: (settings) {
        if (settings.name != '/me') {
          return GetPageRoute(
            settings: settings,
            page: () => const MeScreen02(),
          );
        }
        return null;
      },
    );
  }
}
