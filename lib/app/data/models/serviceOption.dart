// Service option model
import 'package:flutter/material.dart';

class ServiceOption {
  final String iconPath;
  final String label;
  final VoidCallback? onTap;
  final bool isImageAsset;
  final Color? backgroundColor;

  ServiceOption({
    required this.iconPath,
    required this.label,
    this.onTap,
    this.isImageAsset = false,
    this.backgroundColor,
  });
}
