import 'package:flutter/material.dart';

import '../../controllers/base_controller.dart';
import '../../routes/navs/cardsTabs04.dart';
import '../../routes/navs/dashboard02.dart';
import '../../routes/navs/invest03.dart';
import '../../routes/navs/me03.dart';
import '../../routes/navs/payments03.dart';
import '../../utils/constants/data_constant.dart';
import 'widgets/scroll_to_hide_widget.dart';

import 'package:get/get.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final BaseController controller = Get.put(BaseController());
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = Get.arguments ?? 0;
    controller.setInitialIndex(_currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    print('BottomNavigation built with index: $_currentIndex');
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [
            Dashboard02(),
            Invest03(),
            Payments03(),
            Cardstabs04(),
            Me03(),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Obx(() => ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            clipBehavior: Clip.antiAlias,
            child: ScrollToHideWidget(
              child: BottomNavigationBar(
                key: ValueKey<int>(
                    controller.currentIndex.value), // Force rebuild
                onTap: (index) => _onItemTapped(index),
                currentIndex: controller.currentIndex.value,
                backgroundColor: secondaryColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white.withOpacity(0.6),
                type: BottomNavigationBarType.fixed,
                elevation: 20,
                selectedIconTheme: const IconThemeData(
                  color: Colors.white,
                  size: 28,
                ),
                unselectedIconTheme: IconThemeData(
                  color: Colors.white.withOpacity(0.6),
                  size: 24,
                ),
                selectedLabelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.white.withOpacity(0.6),
                ),
                items: const [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage('lib/assets/home01.png'),
                      ),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage('lib/assets/invest03.png'),
                      ),
                    ),
                    label: 'Invest',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage('lib/assets/payment03.png'),
                      ),
                    ),
                    label: 'Payment',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage('lib/assets/cards03.png'),
                      ),
                    ),
                    label: 'Cards',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage('lib/assets/me03.png'),
                      ),
                    ),
                    label: 'Me',
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _onItemTapped(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
      controller.changeIndex(index); // Update GetX controller
    }
  }
}
