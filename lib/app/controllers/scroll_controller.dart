import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
        ScrollController()); // Register the ScrollController as a dependency
  }
}
