import 'package:flutter/material.dart';

import '../constants/constant.dart';

class Validator {
  //password validator
  static String? validatePasswordSignUp(String value) {
    if (value.isEmpty) {
      return "Password is required";
    } else if (value.isNotEmpty &&
        RegExp(Constants.PASSWORD_REGEX).hasMatch(value)) {
      return "Invalid Password";
    } else {
      return null;
    }
  }

  static String? validateConfirmPasswor(
      String value, TextEditingController _password) {
    if (value.isEmpty) {
      return "Password is required";
    } else if (value.isNotEmpty &&
        RegExp(Constants.PASSWORD_REGEX).hasMatch(value)) {
      return "Invalid Password";
    } else if (value != _password.text) {
      return "Password doesn't Match";
    } else {
      return null;
    }
  }

  //email validator
  static String? validateEmailId(String value) {
    if (value.isEmpty) {
      return "Email is required";
    }
    return value.isNotEmpty && RegExp(Constants.EMAIL_REGEX).hasMatch(value)
        ? null
        : "Invalid Email";
  }

  static String? validateName(String value) {
    if (value.isEmpty) {
      return "Name is required";
    }
    return value.isNotEmpty && RegExp(Constants.Name_REGEX).hasMatch(value)
        ? null
        : "Invalid Name";
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return "Enter the required Number";
    }
    return value.isNotEmpty && RegExp(Constants.PHONE_REGEX).hasMatch(value)
        ? null
        : "Invalid Number";
  }
}
