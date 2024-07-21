import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:webapp/FEATURE/screens/home/home.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    Get.offAll(() => const HomeScreen());
  }
}
