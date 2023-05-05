import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  Widget? child;
  EdgeInsets? padding;
  EdgeInsets? containerpadding;
  EdgeInsets? margin;
  Color? color;
  BoxShadow? boxShadow;
  CustomCard(
      {Key? key,
      this.child,
      this.padding,
      this.margin,
      this.color,
      this.containerpadding,
      this.boxShadow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
          padding: containerpadding ?? const EdgeInsets.fromLTRB(0, 3, 0, 3),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            color: color ?? const Color(0xFFFFFFFF),
            boxShadow: [
              boxShadow ??
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    offset: Offset(2, 2),
                    // blurStyle: BlurStyle.normal,
                    blurRadius: 6.0,
                  ),
            ],
          ),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(10.0),
            child: child,
          )),
    );
  }
}
