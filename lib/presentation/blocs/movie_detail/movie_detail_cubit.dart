import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mcuapp/domain/entities/app_error.dart';
import 'package:mcuapp/domain/entities/movie_detail_entity.dart';
import 'package:mcuapp/domain/usecases/get_movie_detail.dart';
import 'package:mcuapp/domain/entities/movie_params.dart';
import 'package:mcuapp/domain/usecases/get_movie_detail.dart';
import 'package:mcuapp/presentation/blocs/cast/cast_cubit.dart';
import 'package:mcuapp/presentation/blocs/favorite/favorite_cubit.dart';
import 'package:mcuapp/presentation/blocs/loading/loading_cubit.dart';
import 'package:mcuapp/presentation/blocs/videos/videos_bloc.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastCubit castBloc;
  final VideosBloc videosCubit;
  final FavoriteCubit favoriteCubit;
  final LoadingCubit loadingCubit;

  MovieDetailCubit({
    @required this.getMovieDetail,
    @required this.castBloc,
    @required this.videosCubit,
    @required this.favoriteCubit,
    @required this.loadingCubit,
  }) : super(MovieDetailInitial());

  void loadMovieDetail(int movieId) async {
    loadingCubit.show();
    final Either<AppError, MovieDetailEntity> eitherResponse =
    await getMovieDetail(
      MovieParams(movieId),
    );

    emit(eitherResponse.fold(
          (l) => MovieDetailError(),
          (r) => MovieDetailLoaded(r),
    ));

    favoriteCubit.checkIfMovieFavorite(movieId);
    castBloc.loadCast(movieId);
    videosCubit.loadVideos(movieId);
    loadingCubit.hide();
  }
}