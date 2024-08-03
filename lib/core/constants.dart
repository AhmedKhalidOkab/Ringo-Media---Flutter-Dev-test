import 'package:calender/core/theming/colors.dart';
import 'package:calender/core/theming/styles.dart';
import 'package:calender/presentation/screens/calender/widget/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

TextEditingController usernamecontrollar = TextEditingController();
TextEditingController passwordcontrollar = TextEditingController();
bool enterEmailAndPassword = false;

List<double> hights = [107, 138, 79, 127, 133];
AppBar layoutAppBar(text) => AppBar(
      foregroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 80.h,
      centerTitle: false,
      backgroundColor: ColorsManager.backGroungColor2,
      leading: Padding(
        padding: const EdgeInsets.all(12.0).w,
        child: SvgPicture.asset(
          'assets/images/menu.svg',
        ),
      ),
      title: Text(
        text,
        style: TextStyles.font16BlackBold,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(24.0).w,
          child: Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8).r,
              border:
                  Border.all(color: ColorsManager.containerColor, width: 1.5.w),
            ),
            child: Center(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    height: 24.h,
                    width: 24.w,
                    'assets/images/notification.svg',
                  ),
                  Positioned(
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 6.r,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 4.r,
                        ),
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    );
Future<dynamic> ShowBottomSheet(
  BuildContext context,
) {
  return showModalBottomSheet(
      isDismissible: true,
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) => BottomSheetWidget());
}
