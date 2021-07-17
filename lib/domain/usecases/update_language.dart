import 'package:dartz/dartz.dart';
import 'package:mcuapp/domain/entities/app_error.dart';
import 'package:mcuapp/domain/entities/movie_entity.dart';
import 'package:mcuapp/domain/repositories/movie_repository.dart';
import 'package:mcuapp/domain/entities/no_params.dart';
import 'package:mcuapp/domain/usecases/usecase.dart';

class UpadteLanguage extends UseCase<void, String> {
  final AppRepository appRepository;

  UpateLanguage(this.appRepository);

  @override
  Future<Either<AppErro, void>> call(String languageCode) async {
    return await appRepository.updateLanguage(languageCode);
  }
}