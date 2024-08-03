import 'package:calender/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProjectStatuseWidget extends StatelessWidget {
  ProjectStatuseWidget(
      {super.key,
      required this.img,
      required this.projectStatuse,
      required this.gradientColor,
      required this.gradientColor2,
      required this.text});
  String projectStatuse;
  String img;
  String text;
  Color gradientColor;
  Color gradientColor2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: 104.w,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                spreadRadius: .5,
                blurRadius: 15,
                offset: const Offset(0, 10),
                color: gradientColor2.withOpacity(.5)),
          ],
          gradient: LinearGradient(
            colors: [gradientColor, gradientColor2],
            begin: Alignment.topLeft,
            end: Alignment.center,
          ),
          borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: const EdgeInsets.all(16.0).w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyles.font24whiteBold,
                ),
                Spacer(),
                SvgPicture.asset(
                  height: 16.h,
                  width: 16.w,
                  img,
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'project',
              style: TextStyles.font12whitemedium,
            ),
            Text(
              projectStatuse,
              style: TextStyles.font12whitemedium,
            )
          ],
        ),
      ),
    );
  }
}
