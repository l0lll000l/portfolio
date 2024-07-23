import 'package:Portfolio/Utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: TColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
  static final horrizondalProductShadow = BoxShadow(
      color: TColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
