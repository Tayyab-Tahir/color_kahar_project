import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailFormKey = GlobalKey<FormState>();
  final phoneNumberFormKey = GlobalKey<FormState>();
  final phoneNumberButtonColor = const Color(0xffDBDBDB).obs;
  final emailButtonColor = Color(0xffDBDBDB).obs;
  Color activeColor = Color(0xff6BC7F1);
  Color inActiveColor = Color(0xffDBDBDB);
  static const int mobileTypeId = 1;

  static const int emailTypeId = 2;

  int userTypeId = 1;
  Color activeColorLogin = const Color(0xff6BC7F1);
  Color inActiveColorLogin = const Color(0xffDBDBDB);

  void setLoginOptionType(int loginOptionTypeId) {
    if (userTypeId != loginOptionTypeId) {
      userTypeId = loginOptionTypeId;
      update(['login_options_key']);
      update(['TextField_options_key']);
    }
  }

  var email = "".obs;
  var isEmailValid = false.obs;
}
