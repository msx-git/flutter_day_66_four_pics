import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  final int diamonds;
  final int stars;

  const ResultScreen({
    super.key,
    required this.diamonds,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/background.svg',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.w, 3.6.h, 15.w, 67.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Congratulations!',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontFamily: 'Comic',
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff484848),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'You have completed the word!',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: 'Comic',
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff484848),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset('assets/images/left.svg'),
                          Text(
                            '$stars',
                            style: TextStyle(
                              fontSize: 26.sp,
                              fontFamily: 'Comic',
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff484848),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset('assets/images/right.svg'),
                          Text(
                            '$diamonds',
                            style: TextStyle(
                              fontSize: 26.sp,
                              fontFamily: 'Comic',
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff484848),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => route is HomeScreen,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3E87FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      child: Text(
                        'Back to Game',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: 'Comic',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
