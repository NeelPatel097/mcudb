import 'package:dartz/dartz.dart';
import 'package:mcuapp/domain/entities/app_error.dart';
import 'package:mcuapp/domain/entities/no_params.dart';
import 'package:mcuapp/domain/repositories/authentication_repository.dart';
import 'package:mcuapp/domain/usecases/usecase.dart';

class LogoutUser extends UseCase<void, NoParams> {
  final AuthenticationRepository _authenticationRepository;

  LogoutUser(this._authenticationRepository);

  @override
  Future<Either<AppError, void>> call(NoParams params) {
    _authenticationRepository.logoutUser();
  }


}