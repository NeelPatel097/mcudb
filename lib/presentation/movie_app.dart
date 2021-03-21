import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mcuapp/common/screenutil/screenutil.dart';
import 'package:mcuapp/presentation/themes/theme_color.dart';
import 'package:mcuapp/presentation/themes/theme_text.dart';

import 'journeys/home/home_screen.dart';

class MovieApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MCU App',
       theme: ThemeData(
         primaryColor: AppColor.vulcan,
         accentColor: AppColor.marvelRed,
         scaffoldBackgroundColor: AppColor.vulcan,
         visualDensity: VisualDensity.adaptivePlatformDensity,
         textTheme: ThemeText.getTextTheme(),
         appBarTheme: const AppBarTheme(elevation: 0),
       ),
      home: HomeScreen(),
    );
  }
}