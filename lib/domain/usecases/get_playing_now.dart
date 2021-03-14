import 'package:dartz/dartz.dart';
import 'package:mcuapp/domain/entities/app_error.dart';
import 'package:mcuapp/domain/entities/movie_entity.dart';
import 'package:mcuapp/domain/repositories/movie_repository.dart';
import 'package:mcuapp/domain/entities/no_params.dart';
import 'package:mcuapp/domain/usecases/usecase.dart';

class GetPlayingNow extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetPlayingNow(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams, noParams) async{
    return await repository.getPopular();
  }
}