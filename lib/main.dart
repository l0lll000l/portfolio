import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webapp/Authentication/authentication_repository.dart';
import 'package:webapp/FEATURE/screens/home/home.dart';
import 'package:webapp/FEATURE/screens/home/widgets/product.dart';
import 'package:webapp/Utils/Theme/theme.dart';
import 'package:webapp/firebase_options.dart';

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
