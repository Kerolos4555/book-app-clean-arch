import 'package:bookly_app_clean_arc/core/errors/failure.dart';
import 'package:bookly_app_clean_arc/features/home/data/data_sources/local/home_local_data_source.dart';
import 'package:bookly_app_clean_arc/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';
import 'package:bookly_app_clean_arc/features/home/domain/repositories/home_repo/home_repo.dart';
import 'package:dartz/dartZ.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> booksList = homeLocalDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber,
      );
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      List<BookEntity> books = await homeRemoteDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber,
      );
      return right(books);
    } on DioException catch (exception) {
      return left(ServerFailure.fromDioException(exception));
    } catch (exception) {
      return left(ServerFailure(errorMessage: exception.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> booksList = homeLocalDataSource.fetchNewestBooks(
        pageNumber: pageNumber,
      );
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      List<BookEntity> books = await homeRemoteDataSource.fetchNewestBooks(
        pageNumber: pageNumber,
      );
      return right(books);
    } on DioException catch (exception) {
      return left(ServerFailure.fromDioException(exception));
    } catch (exception) {
      return left(ServerFailure(errorMessage: exception.toString()));
    }
  }
}
