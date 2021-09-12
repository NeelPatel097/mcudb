import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mcuapp/common/constants/languages.dart';
import 'package:mcuapp/common/constants/route_constants.dart';
import 'package:mcuapp/common/screenutil/screenutil.dart';
import 'package:mcuapp/di/get_it.dart';
import 'package:mcuapp/presentation/app_localizations.dart';
import 'package:mcuapp/presentation/blocs/language/language_bloc.dart';
import 'package:mcuapp/presentation/blocs/login/login_bloc.dart';
import 'package:mcuapp/presentation/fade_page_route_builder.dart';
import 'package:mcuapp/presentation/routes.dart';
import 'package:mcuapp/presentation/themes/theme_color.dart';
import 'package:mcuapp/presentation/themes/theme_text.dart';
import 'package:mcuapp/presentation/wiredash_app.dart';
import 'package:wiredash/wiredash.dart';

import 'journeys/home/home_screen.dart';

class MovieApp extends StatefulWidget {

  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {

  final _navigatorKey = GlobalKey<NavigatorState>();
  LanguageBloc _languageBloc;
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
    _languageBloc.add(LoadPreferredLanguageEvent());
    _loginBloc = getItInstance<LoginBloc>();
  }

  @override
  void dispose() {
    _languageBloc?.close();
    _loginBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
        providers: [
          BlocProvider<LanguageBloc>.value(
          value: _languageBloc),
          BlocProvider<LoginBloc>.value(
              value: _loginBloc),
        ], child: BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        if (state is LanguageLoaded) {
          return WiredashApp(
            navigatorKey: _navigatorKey,
            languageCode: state.locale.languageCode,
            child: MaterialApp(
              navigatorKey: _navigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'MCU App',
              theme: ThemeData(
                unselectedWidgetColor: AppColor.white,
                primaryColor: AppColor.vulcan,
                accentColor: AppColor.marvelRed,
                scaffoldBackgroundColor: AppColor.vulcan,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                textTheme: ThemeText.getTextTheme(),
                appBarTheme: const AppBarTheme(elevation: 0),
              ),
              supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
              locale: state.locale,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              builder: (context, child) {
                return child;
              },
              initialRoute: RouteList.initial,
              onGenerateRoute: (RouteSettings settings) {
                final routes = Routes.getRoutes(settings);
                final WidgetBuilder builder = routes[settings.name];
                return FadePageRouteBuilder(
                  builder: builder,
                  settings: settings,
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    ),
    );

  }
}