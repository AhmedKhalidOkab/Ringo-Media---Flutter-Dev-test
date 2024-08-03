import 'package:calender/core/constants.dart';
import 'package:calender/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginFormFieldWidget extends StatefulWidget {
  LoginFormFieldWidget({
    super.key,
  });
  State<LoginFormFieldWidget> createState() => _LoginFormFieldWidgetState();
}

class _LoginFormFieldWidgetState extends State<LoginFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username / Email',
            style: TextStyles.font14BlackSemiBold,
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
              onChanged: (value) {
                setState(() {
                  usernamecontrollar.text = value;
                  enterEmailAndPassword = true;
                  print(
                      '=============================${enterEmailAndPassword}');
                });
              },
              controller: usernamecontrollar,
              decoration: InputDecoration(
                hintStyle: TextStyles.font16lightGrayregular,
                hintText: 'Enter Username / Email',
              )),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Password',
            style: TextStyles.font14BlackSemiBold,
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
              onChanged: (value) {
                setState(() {
                  print('++++++++++++++++++++++++++++++++');
                  passwordcontrollar.text = value;
                  enterEmailAndPassword = true;
                });
              },
              controller: passwordcontrollar,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/images/eye.svg',
                  ),
                ),
                hintStyle: TextStyles.font16lightGrayregular,
                hintText: 'Enter password here',
              )),
        ]);
  }
}
