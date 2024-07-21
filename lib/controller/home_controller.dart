import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:webapp/model/app_model.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final messageSent = false.obs;
  final isAdmin = false.obs;
  final _db = FirebaseFirestore.instance;
  final appDataList = <AppModel>[].obs;
  updateSingleField({required Map<String, dynamic> json}) async {
    try {
      await _db.collection('Details').add(json);
      messageSent.value = true;
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong. Please try again later';
    }
  }

  admin() async {
    try {
      final snapShot = await _db.collection('Admin').doc('1').get();
      if (snapShot.data()!.values.join() == 'true') {
        isAdmin.value = true;
      } else {
        isAdmin.value = false;
      }
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong';
    }
  }

  fetchAllFields() async {
    try {
      final snapShot = await _db.collection('Apps').get();
      final appData = snapShot.docs.map((e) => AppModel.fromJson(e)).toList();
      appDataList.assignAll(appData);
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong';
    }
  }

  updateAllFields() async {
    try {
      Map<String, dynamic> json = {
        'Name': '',
        'Subtitle': '',
        'Details': {
          'ImageList': [],
          'Title': '',
          'Text1': '',
          'Text2': '',
          'Text3': '',
        },
      };

      await _db.collection('Apps').add(json);
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong';
    }
  }
}
