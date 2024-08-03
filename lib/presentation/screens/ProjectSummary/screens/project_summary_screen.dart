import 'package:calender/core/constants.dart';
import 'package:calender/core/theming/colors.dart';
import 'package:calender/presentation/screens/ProjectSummary/widgets/bottom_view_all_widget.dart';
import 'package:calender/presentation/screens/ProjectSummary/widgets/list_of_productivity.dart';
import 'package:calender/presentation/screens/ProjectSummary/widgets/list_of_statuse_widget.dart';
import 'package:calender/presentation/screens/ProjectSummary/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectSummary extends StatelessWidget {
  const ProjectSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backGroungColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 1,
              color: Colors.grey.withOpacity(.3),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0).w,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchWidget(),
                  ListOfStatuseWidgets(),
                  BottomViewWidget()
                ],
              ),
            ),
            const ListOfProductivity(),
          ],
        ),
      ),
    );
  }
}
