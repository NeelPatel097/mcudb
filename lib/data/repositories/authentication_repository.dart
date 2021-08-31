import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> params);

  Future<Either<AppError, void>> logoutUser();
}