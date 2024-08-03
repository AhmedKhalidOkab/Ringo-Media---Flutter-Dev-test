import 'package:calender/presentation/screens/ProjectSummary/widgets/project_statuse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOfStatuseWidgets extends StatelessWidget {
  const ListOfStatuseWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(    mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,children: [   FittedBox(
                    child: Row(
                      children: [
                        ProjectStatuseWidget(
                          gradientColor: Color(0xFF3A9ADE),
                          gradientColor2: Color(0xFF5EACE4),
                          img: 'assets/images/clock.svg',
                          projectStatuse: 'In Progress',
                          text: '10',
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        ProjectStatuseWidget(
                          gradientColor: Color(0xFF3F8B8D),
                          gradientColor2: Color(0xFF58B2B4),
                          img: 'assets/images/verify.svg',
                          projectStatuse: ' Competed',
                          text: '24',
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        ProjectStatuseWidget(
                          gradientColor: Color(0xFFDD4A4A),
                          gradientColor2: Color(0xFFE87777),
                          img: 'assets/images/close-circle.svg',
                          projectStatuse: 'Cancelled',
                          text: '5',
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),],);
  }
}