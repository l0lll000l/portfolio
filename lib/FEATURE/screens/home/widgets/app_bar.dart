import 'package:Portfolio/Utils/device/device_utility.dart';
import 'package:Portfolio/common/gradient_button.dart';
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
    final controller = HomeController.instance;
    return AppBar(
      title: Text(
        'I0III000I',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            'Home',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            'Services',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            'Projects',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Colors.white),
          ),
        ),
        Obx(() {
          if (controller.isAdmin.value) {
            return Padding(
              padding: const EdgeInsets.only(right: 20.0),
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
        const SizedBox(
          width: 50,
        ),
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
