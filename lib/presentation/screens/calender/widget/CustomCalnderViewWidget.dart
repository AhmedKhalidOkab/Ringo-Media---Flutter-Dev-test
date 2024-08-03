import 'package:calender/core/theming/colors.dart';
import 'package:calender/presentation/screens/calender/widget/meeting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomCalnderViewWidget extends StatelessWidget {
  const CustomCalnderViewWidget({
    super.key,
    required this.meeting,
  });

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        left: 22.w,
        top: 0.w,
        right: 0.w,
        bottom: 10.h,
      ),
      child: Row(
        children: [
          Container(
            width: 10.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: meeting.backgroundfisrt,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.sp),
                bottomLeft: Radius.circular(10.sp),
              ),
            ),
          ),
          SizedBox(
            width: w * 0.7222,
            child: Container(
              decoration: BoxDecoration(
                color: meeting.background,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.sp),
                  bottomRight: Radius.circular(10.sp),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meeting.eventName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/Time Circle.svg',
                          width: 12.h,
                          height: 12.h,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          '${meeting.from.hour}:${meeting.from.minute} AM - ${meeting.to.hour}:${meeting.to.minute} PM',
                          style: TextStyle(
                            color: ColorsManager.lightGray,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildToggleButton(String title, bool isSelected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      height: 40.h,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          const Spacer(),
          Container(
            width: 160.w,
            height: 1.5,
            color: isSelected ? Colors.black : Colors.transparent,
          ),
        ],
      ),
    ),
  );
}

