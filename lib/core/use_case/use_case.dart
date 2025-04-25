import 'package:bookly_app_clean_arc/core/errors/failure.dart';
import 'package:dartz/dartZ.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failure, T>> call({Param pageNumber});
}
