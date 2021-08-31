import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mcuapp/data/core/unauthorised_exception.dart';
import 'package:mcuapp/domain/entities/app_error.dart';
import 'package:mcuapp/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extemds AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationLocalDataSourceDataSource _authenticationRemoteDataSource;

  AuthenticationRepositoryImpl(
    this._authenticationRemoteDataSource,
      this._authenticationLocalDataSource,
  );

  Future<Either<AppError, RequestTokenModel>> _getRequestToken() async {
      try {
        final response = await _authenticationRemoteDataSource.getRequestToken();
        return Right(response);
      } on SocketException {
        return Left(AppError(AppErrorType.network))
      }
  }

  @override
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> body) async {
      final requestTokenEitherResponse = await _getRequestToken();
      final token1 = requestTokenEitherResponse.getOrElse(() => null)?.requestToken ?? '';

      try {
        body.putIfAbsent('request_token', ()=> token1);
        final validateWithLoginToken = await _authenticationRemoteDataSource.validateWithLogin(body);
        final sessionId = await _authenticationRemoteDataSource.createSession(validateWIthLoginToken.toJson());
        if (sessionId != null) {
          await _authenticationLocalDataSource.saveSessionId(sessionId);
          return Right(true);
        }
        return Left(AppError(AppErrorType.sessionDenied));
      } on SocketException {
        return Left(AppError(AppErrorType.network));
      } on UnauthorisedException {
        return Left(AppError(AppErrorType.unauthorised));
      } on Exception {
        return Left(AppError(AppErrorType.api));
      }
  }

  @override
  Future<Either<AppError, void>> logoutUser() async {

  }
}