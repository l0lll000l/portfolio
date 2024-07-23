import 'package:Portfolio/FEATURE/screens/home/home.dart';
import 'package:Portfolio/Utils/Theme/theme.dart';
import 'package:Portfolio/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Portfolio/FEATURE/screens/home/widgets/app_bar.dart';
import 'package:Portfolio/FEATURE/screens/home/widgets/lets_work_together.dart';
import 'package:Portfolio/FEATURE/screens/home/widgets/product.dart';
import 'package:Portfolio/FEATURE/screens/home/widgets/social_media.dart';
import 'package:Portfolio/Utils/constants/image_strings.dart';
import 'package:Portfolio/Utils/constants/sizes.dart';
import 'package:Portfolio/common/device_frame.dart';
import 'package:Portfolio/common/frosted_glass.dart';
import 'package:Portfolio/common/rounded_container.dart';
import 'package:Portfolio/common/rounded_image.dart';
import 'package:Portfolio/controller/home_controller.dart';
import 'package:Portfolio/model/app_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Portfolio',
        theme: TAppTheme.lightTheme,
        home: const HomeScreen());
  }
}
