import 'package:calender/core/theming/colors.dart';
import 'package:calender/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaAccount extends StatelessWidget {
  SocialMediaAccount({super.key, required this.img, required this.text});
  String img;

  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8).r,
          border: Border.all(width: 1, color: ColorsManager.containerColor)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                img,
              ),
              SizedBox(
                width: 41.w,
              ),
              Text(
                text,
                style: TextStyles.font16blackbold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
