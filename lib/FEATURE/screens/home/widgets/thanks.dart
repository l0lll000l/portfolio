import 'package:Portfolio/FEATURE/screens/home/widgets/social_media.dart';
import 'package:Portfolio/common/frosted_glass.dart';
import 'package:flutter/material.dart';

class Thanks extends StatelessWidget {
  const Thanks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return FrostedGlass(
      theWidth: double.infinity,
      theHeight: size < 500 ? 100 : 150,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Thank you for visiting my portfolio! I invite you to explore and see how my skills and experiences align with your project needs. Let’s create something amazing together!',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMedia(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
