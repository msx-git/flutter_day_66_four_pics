import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'view/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 823),
      builder: (context, child) => const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: '4 Words 1 Pic',
        home: HomeScreen(),
      ),
    );
  }
}
