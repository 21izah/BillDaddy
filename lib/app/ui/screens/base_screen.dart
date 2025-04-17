// import 'package:billdaddy/app/controllers/base_controller.dart';
// import 'package:billdaddy/app/ui/screens/bottomNavigation02.dart';
// import 'package:billdaddy/app/ui/screens/cards_screen.dart';
// import 'package:billdaddy/app/ui/screens/dashboard_screen.dart';
// import 'package:billdaddy/app/ui/screens/invest_screen.dart';
// import 'package:billdaddy/app/ui/screens/payment_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../routes/navs/cardsTabs04.dart';
// import '../../routes/navs/dashboard02.dart';
// import '../../routes/navs/invest03.dart';
// import '../../routes/navs/me03.dart';
// import '../../utils/constants/data_constant.dart';
// import 'cardTabCSreen.dart';
// import 'me_screen02.dart';
// import 'widgets/scroll_to_hide_widget.dart';

// class BaseScreen extends StatelessWidget {
//   const BaseScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(
//         () => IndexedStack(
//           index: BaseController.to.currentIndex.value,
//           children: [
//             Dashboard02(),
//             Invest03(),
//             PaymentScreen(),
//             Cardstabs04(),
//             Me03(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: ClipRRect(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(40),
//           topRight: Radius.circular(40),
//         ),
//         clipBehavior: Clip.antiAlias,
//         child: ScrollToHideWidget(
//           child: BottomNavigationBar(
//             onTap: (index) => BaseController.to.changeIndex(index),
//             currentIndex:
//                 BaseController.to.currentIndex.value, // Use the managed index
//             backgroundColor: secondaryColor,
//             selectedItemColor: Colors.white,
//             unselectedItemColor: Colors.white.withOpacity(0.6),
//             type: BottomNavigationBarType.fixed,
//             elevation: 20,
//             selectedIconTheme: IconThemeData(
//               color: Colors.white,
//               size: 28,
//             ),
//             unselectedIconTheme: IconThemeData(
//               color: Colors.white.withOpacity(0.6),
//               size: 24,
//             ),
//             selectedLabelStyle: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//             unselectedLabelStyle: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.normal,
//               color: Colors.white.withOpacity(0.6),
//             ),
//             items: [
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: ImageIcon(
//                     AssetImage('lib/assets/home01.png'),
//                   ),
//                 ),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: ImageIcon(
//                     AssetImage('lib/assets/invest03.png'),
//                   ),
//                 ),
//                 label: 'Invest',
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: ImageIcon(
//                     AssetImage('lib/assets/payment03.png'),
//                   ),
//                 ),
//                 label: 'Payment',
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: ImageIcon(
//                     AssetImage('lib/assets/cards03.png'),
//                   ),
//                 ),
//                 label: 'Cards',
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: ImageIcon(
//                     AssetImage('lib/assets/me03.png'),
//                   ),
//                 ),
//                 label: 'Me',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
