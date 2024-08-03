import 'package:calender/core/constants.dart';
import 'package:calender/core/theming/styles.dart';
import 'package:calender/presentation/screens/LayOut/screen/lay_out_screen.dart';
import 'package:calender/presentation/screens/login/widgets/container_of_continu.dart';
import 'package:calender/presentation/screens/login/widgets/do_not_have_account_text_.dart';
import 'package:calender/presentation/screens/login/widgets/login_bottom.dart';
import 'package:calender/presentation/screens/login/widgets/login_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

bool _passwordVisible = false;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              const LoginTextWidget(),
              SizedBox(
                height: 40.h,
              ),
              CustomTextuserAndPAssword(),
              SizedBox(
                height: 24.h,
              ),
              LoginBottomWidget(
                onTap: () {
                  if (passwordcontrollar.text.isNotEmpty &&
                      usernamecontrollar.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const LayOytScreen())),
                    );
                  } else {
                    showAdaptiveDialg(context);
                  }
                },
                color: passwordcontrollar.text.isNotEmpty &&
                        usernamecontrollar.text.isNotEmpty
                    ? Colors.black
                    : Colors.grey,
              ),
              SizedBox(
                height: 24.h,
              ),
              SocialMediaAccount(
                img: 'assets/images/Google.svg',
                text: 'Continue with Google',
              ),
              SizedBox(
                height: 16.h,
              ),
              SocialMediaAccount(
                img: 'assets/images/Facebook.svg',
                text: 'Continue with Facebook',
              ),
              SizedBox(
                height: 16.h,
              ),
              SocialMediaAccount(
                img: 'assets/images/Apple.svg',
                text: 'Continue with Apple',
              ),
              SizedBox(
                height: 40.h,
              ),
              const DoNotHaveAccountText()
            ],
          ),
        ),
      ),
    );
  }

  // AdaptiveDialg
  Future<dynamic> showAdaptiveDialg(
    BuildContext context,
  ) {
    return showAdaptiveDialog(
        context: context,
        builder: (BuildContext cntext) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              'Please Enter username/ E-mail and password',
              style: TextStyle(fontSize: 18),
            ),
            actions: [
              TextButton(
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  // CustomTextuserAndPAssword

  Column CustomTextuserAndPAssword() {
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
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
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
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
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
              obscureText: !_passwordVisible,
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                setState(() {
                  print('++++++++++++++++++++++++++++++++');
                  passwordcontrollar.text = value;
                  enterEmailAndPassword = true;
                });
              },
              controller: passwordcontrollar,
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: !_passwordVisible
                        ? SvgPicture.asset(
                            'assets/images/eye-slash.svg',
                          )
                        : SvgPicture.asset(
                            'assets/images/eye.svg',
                          ),
                  ),
                ),
                hintStyle: TextStyles.font16lightGrayregular,
                hintText: 'Enter password here',
              )),
        ]);
  }
}
