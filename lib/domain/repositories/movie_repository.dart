import 'package:dartz/dartz.dart';
import 'package:mcuapp/domain/entities/cast_entity.dart';
import 'package:mcuapp/domain/entities/movie_detail_entity.dart';
import 'package:mcuapp/domain/entities/movie_entity.dart';
import 'package:mcuapp/domain/entities/app_error.dart';

abstract class MovieRepository {
  Future<Either<AppError,List<MovieEntity>>> getTrending();
  Future<Either<AppError,List<MovieEntity>>> getPopular();
  Future<Either<AppError,List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError,List<MovieEntity>>> getComingSoon();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);
  Future<Either<AppError, List<CastEntity>>> getCastCrew(int id);
}