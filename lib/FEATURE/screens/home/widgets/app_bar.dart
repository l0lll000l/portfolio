import 'package:Portfolio/FEATURE/screens/home/home.dart';
import 'package:Portfolio/Utils/device/device_utility.dart';
import 'package:Portfolio/common/gradient_button.dart';
import 'package:Portfolio/common/rounded_container.dart';
import 'package:Portfolio/controller/controller_variables.dart';
import 'package:Portfolio/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class XAppBar extends StatelessWidget implements PreferredSizeWidget {
  const XAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    final controller = HomeController.instance;
    final varController = Get.put(ControllerVariables());
    return AppBar(
      title: Text(
        'I0III000I',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.offAll(() => const HomeScreen());
          },
          child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Obx(
                () => MouseRegion(
                  onEnter: (_) {
                    varController.isHome.value = true;
                  },
                  onExit: (_) {
                    varController.isHome.value = false;
                  },
                  child: XRoundedContainer(
                    padding: const EdgeInsets.all(8.0),
                    backgroundColor: varController.isHome.value
                        ? Colors.white70.withOpacity(0.3)
                        : Colors.transparent,
                    child: Text(
                      'Home',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.white),
                    ),
                  ),
                ),
              )),
        ),
        // GestureDetector(
        //   onTap: () {
        //     Get.offAll(() => const HomeScreen());
        //   },
        //   child: Padding(
        //       padding: const EdgeInsets.only(right: 20.0),
        //       child: Obx(
        //         () => MouseRegion(
        //           onEnter: (_) {
        //             varController.isServices.value = true;
        //           },
        //           onExit: (_) {
        //             varController.isServices.value = false;
        //           },
        //           child: XRoundedContainer(
        //             padding: const EdgeInsets.all(8.0),
        //             backgroundColor: varController.isServices.value
        //                 ? Colors.white70.withOpacity(0.3)
        //                 : Colors.transparent,
        //             child: Text(
        //               'Services',
        //               style: Theme.of(context)
        //                   .textTheme
        //                   .labelMedium!
        //                   .apply(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //       )),
        // ),
        // GestureDetector(
        //   onTap: () {
        //     Get.offAll(() => const HomeScreen());
        //   },
        //   child: Padding(
        //       padding: const EdgeInsets.only(right: 20.0),
        //       child: Obx(
        //         () => MouseRegion(
        //           onEnter: (_) {
        //             varController.isProjects.value = true;
        //           },
        //           onExit: (_) {
        //             varController.isProjects.value = false;
        //           },
        //           child: XRoundedContainer(
        //             padding: const EdgeInsets.all(8.0),
        //             backgroundColor: varController.isProjects.value
        //                 ? Colors.white70.withOpacity(0.3)
        //                 : Colors.transparent,
        //             child: Text(
        //               'Projects',
        //               style: Theme.of(context)
        //                   .textTheme
        //                   .labelMedium!
        //                   .apply(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //       )),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(right: 20.0),
        //   child: Text(
        //     size.toString(),
        //     style: Theme.of(context)
        //         .textTheme
        //         .labelMedium!
        //         .apply(color: Colors.white),
        //   ),
        // ),
        Obx(() {
          if (controller.isAdmin.value) {
            return Padding(
              padding: const EdgeInsets.only(right: 0),
              child: GestureDetector(
                onTap: () {
                  controller.updateAllFields();
                },
                child: Text(
                  'Admin',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: Colors.white),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        }),

        GradientButton(
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.purple, Colors.pink, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            onPressed: () async {
              final Uri gmailUri = Uri(
                scheme: 'https',
                host: 'mail.google.com',
                path: '/mail/u/0/',
                queryParameters: {
                  'view': 'cm',
                  'fs': '1',
                  'to': 'athulmp86@gmail.com',
                  'su': 'Subject', // Optional
                  'body': 'Body', // Optional
                  'bcc': 'athulmp9744@gmail.com', // Optional
                  //  'cc': '', // Optional
                },
              );

              if (await canLaunchUrl(gmailUri)) {
                await launchUrl(gmailUri);
              } else {
                print('Could not launch $gmailUri');
                // Show a user-friendly message or dialog
              }
            },
            child: Text('Lets Talk',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: Colors.white))),
        const SizedBox(
          width: 30,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
