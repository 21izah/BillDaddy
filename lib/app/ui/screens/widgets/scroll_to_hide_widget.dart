import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const ScrollToHideWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;
  late ScrollController _scrollController; // Store the controller

  // @override
  // void initState() {
  //   super.initState();

  //   final _scrollController =
  //       Get.find<ScrollController>(); // Retrieve the controller
  //   _scrollController.addListener(listen);
  // }

  @override
  void initState() {
    super.initState();

    _scrollController =
        Get.find<ScrollController>(); // Correctly assigns to the class field
    _scrollController.addListener(listen);
  }

  @override
  void dispose() {
    _scrollController.removeListener(listen); // Use stored variable
    super.dispose();
  }

  void listen() {
    final direction = _scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isVisible) {
      setState(() {
        isVisible = true;
      });
    }
  }

  void hide() {
    if (isVisible) {
      setState(() {
        isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // duration: widget.duration,
      height: isVisible ? 120 : 0,
      child: widget.child,
    );
  }
}
