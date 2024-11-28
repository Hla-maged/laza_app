import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/constants.dart';
import '../../../auth/presentation/views/start_view.dart';
import 'widgets/container.dart';

class WelcomeView extends StatelessWidget {
  WelcomeView({super.key, required this.toggleTheme});
  final VoidCallback toggleTheme;
  int? gender;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB0A3E5), Color(0xFF7661C5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h, right: 40.w),
                  child: SizedBox(
                      height: 500.h,
                      width: 700.w,
                      child: Image.asset('assets/images/person.png',
                          fit: BoxFit.cover)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Container(
                      height: 0.3.sh,
                      width: 0.85.sw,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 20.h, right: 10.w, left: 10.w),
                        child: Column(
                          children: [
                            Text(
                              'Look Good, Feel Good',
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Create your individual & unique style and look amazing everyday.',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContainerWidget(
                                      onTap: () {},
                                      text: 'Men',
                                      textColor: Colors.grey,
                                      backGColor: const Color(0xffF5F6FA)),
                                  ContainerWidget(
                                      onTap: () {},
                                      text: 'Women',
                                      textColor: Colors.white,
                                      backGColor: kPrimaryColor)
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        StartView(toggleTheme: toggleTheme),
                                  ),
                                );
                              },
                              child: Center(
                                child: Text(
                                  'Skip',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15.sp),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
