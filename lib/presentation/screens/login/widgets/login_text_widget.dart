import 'package:calender/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextWidget extends StatelessWidget {
  const LoginTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
      Text('Login',style:TextStyles.font24BlackBold ,),SizedBox(height: 8.h,),
      Text('Sign in to your account',style:TextStyles.font14LightgrayMedium ,)
      
      
      ],);
  }
}