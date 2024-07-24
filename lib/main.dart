import 'package:Portfolio/FEATURE/screens/home/home.dart';
import 'package:Portfolio/Utils/Theme/theme.dart';
import 'package:Portfolio/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
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
        title: 'ATHUL | ANDROID DEVELOPER | ',
        theme: TAppTheme.lightTheme,
        home: const HomeScreen());
  }
}
