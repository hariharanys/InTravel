import 'package:flutter/material.dart';

class MyProfileModel {
  String? field;
  Icon? icons;

  MyProfileModel({this.field, this.icons});
}

final MyProfileModel personalInformation = MyProfileModel(
    field: 'Personal Information',
    icons: Icon(
      Icons.person,
      size: 18,
      color: Colors.black,
    ));

final MyProfileModel paymentInformation = MyProfileModel(
    field: 'Payment Information',
    icons: Icon(
      Icons.payment_outlined,
      size: 18,
      color: Colors.black,
    ));

final MyProfileModel safety = MyProfileModel(
    field: 'Safety',
    icons: Icon(
      Icons.shield_outlined,
      size: 18,
      color: Colors.black,
    ));

final MyProfileModel notification = MyProfileModel(
    field: 'Notification',
    icons: Icon(
      Icons.notifications,
      size: 18,
      color: Colors.black,
    ));

final MyProfileModel rateApp = MyProfileModel(
    field: 'Rate the app',
    icons: Icon(
      Icons.star_border,
      size: 18,
      color: Colors.black,
    ));

List<MyProfileModel> profileFieldList = [
  personalInformation,
  paymentInformation,
  safety,
  notification,
  rateApp
];
