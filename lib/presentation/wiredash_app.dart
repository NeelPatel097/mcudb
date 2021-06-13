import 'package:flutter/material.dart';
import 'package:mcuapp/presentation/themes/theme_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {

  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WiredashApp({
    Key key,
    @required this.navigatorKey,
    @required this.child,
    @required this.languageCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'mcu-app-dr2qisv',
      secret: '67nkdqdlp3n8cipi8fwfqraki6glicq541yke7zjlkobrbtv',
      navigatorKey: navigatorKey,
      child: child,
      options: WiredashOptionsData(
        locale: Locale.fromSubtags(
          languageCode: languageCode,
        ),
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.marvelRed,
        secondaryColor: AppColor.marvelRed,
        secondaryBackgroundColor: AppColor.vulcan,
        dividerColor: AppColor.vulcan
      ),
    );
  }
}
