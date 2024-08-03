import 'package:calender/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DoNotHaveAccountText extends StatelessWidget {
  const DoNotHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
          text: TextSpan(
              text: "Don'\t have an account? ",
              style: TextStyles.font14lightGrayBold,
              children: [
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () {},
              text: "Register Here",
              style: TextStyles.font14BlackBold,
            )
          ])),
    );
  }
}
