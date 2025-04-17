// import 'package:flutter/material.dart';

// import '../../views/screens/dashboard_screen.dart';
// import '../../views/widgets/layout_scaffold.dart';
// import 'routes.dart';

// final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

// final router = GoRouter(
//   navigatorKey: _rootNavigatorKey,
//   initialLocation: Routes.homePage,
//   routes: [
//     StatefulShellRoute.indexedStack(
//       builder: (context, state, navigationShell) => LayoutScaffold(
//         navigationShell: navigationShell,
//       ),
//       branches: [
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: Routes.homePage,
//               builder: (context, state) => const DashboardScreen(),
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: Routes.homePage,
//               builder: (context, state) => const DashboardScreen(),
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//                 path: Routes.homePage,
//                 builder: (context, state) => const DashboardScreen(),
//                 routes: [
//                   GoRoute(
//                     path: Routes.homePage,
//                   ),
//                 ]),
//           ],
//         ),
//       ],
//     ),
//   ],
// );
