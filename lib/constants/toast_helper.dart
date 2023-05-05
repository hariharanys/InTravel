import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'
    show FToast, Fluttertoast, Toast, ToastGravity;

enum ToastType { success, warning, error, info }

class ToastHelper {
  FToast? fToast;

  showToast(String message, {ToastType type = ToastType.success}) {
    switch (type) {
      case ToastType.success:
        success(message);
        break;
      case ToastType.warning:
        warning(message);
        break;
      case ToastType.error:
        error(message);
        break;
      default:
        info(message);
    }
  }

  void initState(BuildContext context) {
    fToast = FToast();
    fToast!.init(context);
  }

  static const int _colorOpacity = 350;

  success(String message) {
    _toast(message, Colors.green.shade700);
  }

  error(String message) {
    _toast(message, Colors.red.shade700);
  }

  warning(String message) {
    _toast(message, Colors.green.shade700);
  }

  info(String message) {
    _toast(message, Colors.red.shade700);
  }

  static toast(String message, Color? color) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: const Color(0xFF5E821A),
      fontSize: 16.0,
    );
  }

  void _toast(String message, Color? color) async {
    await Future.delayed(const Duration(milliseconds: 400));
    fToast!.showToast(
      toastDuration: const Duration(milliseconds: 3000),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: color?.withOpacity(0.9)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          message.trim(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            fToast!.removeCustomToast();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
    );
  }
}
