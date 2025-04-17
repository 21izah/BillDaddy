import 'package:billdaddy/app/ui/screens/cardTabCSreen.dart';
import 'package:billdaddy/app/utils/constants/nav_ids.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cardstabs04 extends StatelessWidget {
  const Cardstabs04({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.cards),
      onGenerateRoute: (settings) {
        if (settings.name != '/cards') {
          return GetPageRoute(
            settings: settings,
            page: () => const Cardtabcsreen(),
          );
        }
        return null;
      },
    );
  }
}
