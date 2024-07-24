import 'package:Portfolio/FEATURE/screens/home/widgets/social_media.dart';
import 'package:Portfolio/Utils/constants/image_strings.dart';
import 'package:Portfolio/Utils/constants/sizes.dart';
import 'package:Portfolio/common/frosted_glass.dart';
import 'package:Portfolio/common/rounded_container.dart';
import 'package:Portfolio/common/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroAndProfile extends StatelessWidget {
  const IntroAndProfile({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, I am Athul', style: GoogleFonts.outfit().apply()),
            Text('Flutter Full-Stack Developer </>',
                style: size.width > 607
                    ? Theme.of(context).textTheme.displaySmall!.apply(
                        color: Colors.white, overflow: TextOverflow.ellipsis)
                    : const TextStyle(fontSize: 25, color: Colors.white)),
            Text('Building Tomorrow’s Android Apps with Today’s Technology',
                style: size.width > 600
                    ? Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: Colors.white)
                    : const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      )),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                    icon: const Icon(Icons.moving_outlined)),
                Text('Hire Me Now',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: Colors.white)),
              ],
            ),

            /// social media icon
            const SocialMedia(),
          ],
        ),
        const Spacer(),
        if (size.width > 858)
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Column(
              children: [
                FrostedGlass(
                    theHeight: 250,
                    theWidth: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const XRoundedContainer(
                          backgroundColor: Colors.transparent,
                          child: TRoundedImage(
                              applyImageRadius: true, imageurl: XImages.me),
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        Text('ATHUL M P',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 27),
                          child: Text('Mobile App Developer',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .apply(color: Colors.white)),
                        )
                      ],
                    )),
              ],
            ),
          ),
      ],
    );
  }
}
// Theme.of(context).textTheme.bodyMedium!.apply(
//                       color: Colors.white,