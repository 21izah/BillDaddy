// import 'package:billdaddy/app/controllers/base_controller.dart';
// import 'package:flutter/material.dart';

// import '../../utils/constants/data_constant.dart';
// import 'widgets/scroll_to_hide_widget.dart';

// import 'package:get/get.dart';

// import 'cardTabCSreen.dart';
// import 'dashboard_screen.dart';
// import 'invest_screen.dart';
// import 'me_screen02.dart';
// import 'payment_screen.dart';

// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => NavigationBar(
//         indicatorColor: Colors.pink,
//         elevation: 10,
//         selectedIndex: BaseController.to.currentIndex.value,
//         onDestinationSelected: (value) => BaseController.to.changeIndex(value),
//         destinations: [
//           NavigationDestination(
//             icon: Icon(Icons.abc_outlined),
//             label: 'home',
//             selectedIcon: Icon(Icons.abc),
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//             selectedIcon: Icon(Icons.person_2),
//           ),
//         ],
//       ),
//     );
//   }
// }
