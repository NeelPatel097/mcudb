abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params, params);
}

