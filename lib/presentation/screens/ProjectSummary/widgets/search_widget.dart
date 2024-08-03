import 'package:calender/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {    TextEditingController searchcontrollar = TextEditingController();

    return Column(       mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,children: [   Text(
                    'Search',
                    style: TextStyles.font14BlackSemiBold,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TextFormField(
                      controller: searchcontrollar,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: SvgPicture.asset(
                            height: 24.h,
                            width: 24.w,
                            'assets/images/search-normal.svg',
                          ),
                        ),
                        hintStyle: TextStyles.font16lightGrayregular,
                        hintText: 'Search project here',
                      )),
                  SizedBox(
                    height: 24.h,
                  ),],);
  }
}