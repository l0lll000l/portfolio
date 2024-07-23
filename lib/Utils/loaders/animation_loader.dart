import 'package:Portfolio/Utils/Helpers/helper_functions.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget(
      {super.key,
      this.animation = '',
      required this.text,
      required this.showactionButton,
      this.actionText,
      this.onPressed});
  final String animation;
  final String text;
  final bool showactionButton;
  final String? actionText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DotLottieLoader.fromAsset(animation,
              frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
            if (dotlottie != null) {
              return Lottie.memory(dotlottie.animations.values.single,
                  width: XHelperFunctions.screenWidth() * 0.9,
                  height: XHelperFunctions.screenHeight() * 0.6);
            } else {
              return Container();
            }
          }),
          showactionButton
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: TColors.dark),
                      onPressed: onPressed,
                      child: Text(
                        actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: TColors.light),
                      )),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
