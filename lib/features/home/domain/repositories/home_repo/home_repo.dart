import 'package:bookly_app_clean_arc/core/errors/failure.dart';
import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';
import 'package:dartz/dartZ.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({
    int pageNumber = 0,
  });
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({
    int pageNumber = 0,
  });
}
