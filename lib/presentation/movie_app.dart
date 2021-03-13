class MovieApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false;
      title: 'MCU App',
       theme: ThemeData(
         primaryColor: AppColor.vulcan,
         scaffoldBackgroundColor: AppColor.vulcan,
         visualDensity: VisualDensity.adaptivePlatformDensity,
         textTheme: ThemeText.getTextTheme(),
         appBarTheme: const AppBarTheme(elevation: 0),
       ),
      home: HomeScreen(),
    );
  }
}