
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mcuapp/presentation/movie_app.dart';
import 'package:pedantic/pedantic.dart';

import 'package:mcuapp/di/get_it.dart' as getIt;
import 'presentation/movie_app.dart';


void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  );
  unawaited(getIt.init());
  runApp(MovieApp());
}
