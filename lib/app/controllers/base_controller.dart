import 'package:get/get.dart';

// class BaseController extends GetxController {
//   static BaseController get to => Get.find();
//   var currentIndex = 0.obs;
//   void changeIndex(int newIndex) {
//     if (currentIndex.value != newIndex) {
//       Get.nestedKey(currentIndex.value + 1)
//           ?.currentState
//           ?.popUntil((route) => route.isFirst);
//     }
//     currentIndex.value = newIndex;
//   }
// }

// BaseController.dart
class BaseController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeIndex(int newIndex) {
    if (currentIndex.value != newIndex) {
      currentIndex.value = newIndex;
      update(); // Notify all listeners
    }
  }

  void setInitialIndex(int index) {
    if (currentIndex.value != index) {
      currentIndex.value = index;
      update();
    }
  }
}

// class BaseController extends GetxController {
//   static BaseController get to => Get.find();

//   final RxInt currentIndex = 0.obs;

//   void changeIndex(int newIndex) {
//     if (currentIndex.value != newIndex) {
//       currentIndex.value = newIndex;
//       // Force update all listeners
//       update();
//     }
//   }

//   // Add this to handle initial index
//   void setInitialIndex(int index) {
//     if (currentIndex.value != index) {
//       currentIndex.value = index;
//       update();
//     }
//   }
// } ////////
