import 'package:calender/core/theming/colors.dart';
import 'package:calender/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomViewWidget extends StatelessWidget {
  const BottomViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: ColorsManager.black, width: 1.w)),
          height: 48.h,
          child: Center(
            child: Text(
              'View All Project',
              style: TextStyles.font14BlackBold,
            ),
          ),
        ),
        // SizedBox(
        //   height: 24.h,
        // ),
      ],
    );
  }
}
