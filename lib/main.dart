import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

import 'package:mcuapp/di/get_it.dart' as getIt;
import 'package:mcuapp/data/domain/entities/app_error.dart';
import 'package:mcuapp/data/domain/entities/movie_entity.dart';
import 'package:mcuapp/data/domain/entities/no_params.dart';
import 'package:mcuapp/data/domain/usecases/get_trending.dart';


void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  );
  unawaited(getIt.init());
  runApp(McuApp());
}
