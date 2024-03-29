import 'package:dartz/dartz.dart';
import 'package:mcuapp/domain/entities/app_error.dart';
import 'package:mcuapp/domain/entities/cast_entity.dart';
import 'package:mcuapp/domain/entities/movie_params.dart';
import 'package:mcuapp/domain/repositories/movie_repository.dart';
import 'package:mcuapp/domain/usecases/usecase.dart';

class GetCast extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepository repository;

  GetCast(this.repository);

  @override
  Future<Either<AppError, List<CastEntity>>> call(
      MovieParams movieParams) async {
    return await repository.getCastCrew(movieParams.id);
  }
}