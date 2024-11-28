import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laza_app/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:laza_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:laza_app/features/auth/presentation/views/widgets/custom_title.dart';
import 'package:laza_app/features/auth/presentation/views/widgets/social_media_button.dart';

import 'sign_in_view.dart';

class StartView extends StatelessWidget {
  const StartView({super.key, required this.toggleTheme});

  final VoidCallback toggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomAppBar(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 30.h, bottom: 80.h),
                child: const CustomTitle(text: 'Let’s Get Started')),
            SizedBox(
              height: 50.h,
            ),
            const SocialMediaButton(
              color: Color(0xff4267B2),
              text: 'Facebook',
              icon: FontAwesomeIcons.facebook,
            ),
            const SocialMediaButton(
              color: Color(0xff1DA1F2),
              text: 'Twitter',
              icon: FontAwesomeIcons.twitter,
            ),
            const SocialMediaButton(
              color: Color(0xffEA4335),
              text: 'Google',
              icon: FontAwesomeIcons.google,
            ),
            SizedBox(height: 121.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInView(
                            toggleTheme: toggleTheme,
                            email: '',
                            user: '',
                          ),
                        ));
                  },
                  child: Text(
                    "Signin",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            CustomButton(
                text: 'Create an Account',
                onTap: () {
                  Navigator.pushNamed(context, 'signUp');
                })
          ],
        ),
      ),
    );
  }
}
