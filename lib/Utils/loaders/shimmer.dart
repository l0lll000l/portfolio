import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:Portfolio/Utils/loaders/shimmer.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:Portfolio/Utils/Helpers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:Portfolio/Utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:Portfolio/Utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Portfolio/Utils/constants/sizes.dart';
import 'package:Portfolio/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TShimmerEffect extends StatelessWidget {
  const TShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.color,
    this.radius = 15,
  });
  final double? width;
  final double? height;
  final Color? color;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? (TColors.light),
        ),
      ),
    );
  }
}
