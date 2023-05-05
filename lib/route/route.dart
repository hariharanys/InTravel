import 'package:flutter/material.dart';

import '../view/splashscreen.dart';

const String splashScreen = 'splashScreen';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    default:
      throw ('this route name does not exist');
  }
}
