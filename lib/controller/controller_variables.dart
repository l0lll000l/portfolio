import 'package:get/get.dart';

class ControllerVariables extends GetxController {
  static ControllerVariables get instance => Get.find();

  final isHome = false.obs;
  final isServices = false.obs;
  final isProjects = false.obs;
  final isLatestPrijects = false.obs;
}
