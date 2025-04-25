import 'package:bookly_app_clean_arc/core/errors/failure.dart';
import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';
import 'package:bookly_app_clean_arc/features/home/domain/repositories/home_repo/home_repo.dart';
import 'package:bookly_app_clean_arc/core/use_case/use_case.dart';
import 'package:dartz/dartZ.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call({int pageNumber = 0}) async {
    return await homeRepo.fetchFeaturedBooks(
      pageNumber: pageNumber,
    );
  }
}
