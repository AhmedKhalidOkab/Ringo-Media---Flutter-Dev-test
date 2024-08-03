import 'package:calender/core/constants.dart';
import 'package:calender/core/theming/styles.dart';
import 'package:calender/presentation/screens/ProjectSummary/widgets/productivity_widget.dart';
import 'package:calender/presentation/screens/ProjectSummary/widgets/ratio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ListOfProductivity extends StatelessWidget {
  const ListOfProductivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // height: 400.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Productivity',
                style: TextStyles.font18blackBold,
              ),
              const Spacer(),
              SvgPicture.asset(
                height: 24.h,
                width: 24.w,
                'assets/images/more.svg',
              ),
            ],
          ),
          SizedBox(
              height: 230.h,
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        ProductivityWidget(
                          gradientColor2:
                              const Color(0xFF191C2A).withOpacity(.1),
                          gradientColor:
                              const Color(0xFF191C2A).withOpacity(.2),
                          height: hights[0],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'Jan',
                          style: TextStyles.font14lightGrayBold,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      children: [
                        ProductivityWidget(
                          gradientColor2:
                              const Color(0xFF191C2A).withOpacity(.1),
                          gradientColor:
                              const Color(0xFF191C2A).withOpacity(.2),
                          height: hights[1],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'Feb',
                          style: TextStyles.font14lightGrayBold,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      children: [
                        ProductivityWidget(
                          gradientColor2:
                              const Color(0xFF191C2A).withOpacity(.1),
                          gradientColor:
                              const Color(0xFF191C2A).withOpacity(.2),
                          height: hights[2],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'Mar',
                          style: TextStyles.font14lightGrayBold,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(height: 80.h, width: 70.w, child: TheRatio()),
                        ProductivityWidget(
                          gradientColor2: const Color(0xFF191C2A),
                          gradientColor: const Color(0xFF191C2A),
                          height: 102.h,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'Apr',
                          style: TextStyles.font14Blackmedium,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      children: [
                        ProductivityWidget(
                          gradientColor2:
                              const Color(0xFF191C2A).withOpacity(.1),
                          gradientColor:
                              const Color(0xFF191C2A).withOpacity(.2),
                          height: hights[3],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'May',
                          style: TextStyles.font14lightGrayBold,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      children: [
                        ProductivityWidget(
                          gradientColor2:
                              const Color(0xFF191C2A).withOpacity(.1),
                          gradientColor:
                              const Color(0xFF191C2A).withOpacity(.2),
                          height: hights[4],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'Jun',
                          style: TextStyles.font14lightGrayBold,
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
