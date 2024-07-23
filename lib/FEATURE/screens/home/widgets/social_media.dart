import 'dart:html' as html;

import 'package:Portfolio/Utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () async {
              const url = 'https://github.com/l0lll000l';

              html.window.open(url, '_blank');
            },
            icon: const Image(
              image: AssetImage(XImages.github),
              height: 30,
            )),
        IconButton(
            onPressed: () {
              const url = '  https://www.linkedin.com/in/l0lll000l';

              html.window.open(url, '_blank');
            },
            icon: const Image(
              image: AssetImage(XImages.linkedin),
              height: 30,
            )),
        IconButton(
            onPressed: () {
              const url = 'https://www.instagram.com/l0lll000l/';

              html.window.open(url, '_blank');
            },
            icon: const Image(
              image: AssetImage(XImages.instagram),
              height: 30,
            )),
        IconButton(
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
            icon: const Image(
              image: AssetImage(XImages.email),
              height: 32,
            )),
        TextButton.icon(
            onPressed: () {},
            icon: Image(
              image: AssetImage(XImages.phone),
              height: 32,
            ),
            label: Text(
              '9744690056',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
