import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductivityWidget extends StatelessWidget {
  ProductivityWidget(
      {super.key,
      required this.height,
      required this.gradientColor,
      required this.gradientColor2});
  double height;
  Color gradientColor;
  Color gradientColor2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
          gradient: LinearGradient(
            colors: [gradientColor, gradientColor2],
            begin: Alignment.topLeft,
            end: Alignment.centerLeft,
          )),
    );
  }
}
