import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mcuapp/domain/entities/app_error.dart';
import 'package:mcuapp/domain/entities/movie_entity.dart';
import 'package:mcuapp/domain/entities/no_params.dart';
import 'package:mcuapp/domain/usecases/get_coming_soon.dart';
import 'package:mcuapp/domain/usecases/get_playing_now.dart';
import 'package:mcuapp/domain/usecases/get_popular.dart';
import 'package:meta/meta.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabbedBloc({
    @required this.getPopular,
    @required this.getPlayingNow,
    @required this.getComingSoon
}) : super(MovieTabbedInitial());

  @override
  Stream<MovieTabbedState> mapEventToState(
    MovieTabbedEvent event,
  ) async* {
    if (event is MovieTabChangedEvent) {
      Either<AppError, List<MovieEntity>> moviesEither;
      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getPopular(NoParams());
          break;
        case 1:
          moviesEither = await getPlayingNow(NoParams());
          break;
        case 2:
          moviesEither = await getComingSoon(NoParams());
          break;
      }
      yield moviesEither.fold(
          (l) => MovieTabLoadError(
              currentTabIndex: event.currentTabIndex,
              errorType: l.appErrorType,
          ),
          (movies) {
            return MovieTabChanged(
              currentTabIndex: event.currentTabIndex,
              movies: movies,
            );
          },
      );
    }
  }
}
