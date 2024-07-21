import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp/Utils/Helpers/helper_functions.dart';
import 'package:webapp/Utils/constants/colors.dart';
import 'package:webapp/Utils/loaders/animation_loader.dart';

class TfullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      builder: (context) => PopScope(
          canPop: false,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: XHelperFunctions.isDarkMode(context)
                ? TColors.dark
                : TColors.light,
            child: Column(
              children: [
                const SizedBox(height: 250),
                TAnimationLoaderWidget(
                  animation: animation,
                  showactionButton: false,
                  actionText: 'okey',
                  text: text,
                )
              ],
            ),
          )),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
