import 'package:intl/intl.dart';

class Utils {
  static String dateTime(String type) {
    final now = DateTime.now();
    String formatter = DateFormat(type).format(now);
    return formatter;
  }
}
