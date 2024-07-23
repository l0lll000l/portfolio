import 'package:cloud_firestore/cloud_firestore.dart';

class AppModel {
  final String? name;
  final dynamic? subtitle;
  final DetailsModel? details;
  AppModel({this.name, this.subtitle, this.details});

  /// to json

  /// from json

  factory AppModel.fromJson(QueryDocumentSnapshot<Object?> document) {
    final json = document.data() as Map<String, dynamic>;
    return AppModel(
      name: json['Name'],
      subtitle: json['Subtitle'],
      details: DetailsModel.fromJson(json['Details']) ??
          DetailsModel(
            imageList: [],
            title: '',
            text1: '',
            text2: '',
            text3: '',
          ),
    );
  }

////
}

class DetailsModel {
  final List? imageList;
  final String? title;
  final String? text1;
  final String? text2;
  final String? text3;
  DetailsModel(
      {this.imageList, this.title, this.text1, this.text2, this.text3});

  /// to json

  /// from json

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      imageList: json['ImageList'] ?? [],
      title: json['Title'] ?? '',
      text1: json['Text1'] ?? '',
      text2: json['Text2'] ?? '',
      text3: json['Text3'] ?? '',
    );

    ///
  }
}
// /////////////