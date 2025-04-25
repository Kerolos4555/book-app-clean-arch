import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';

abstract class FeaturedBooksStates {}

class FeaturedBooksInitialState extends FeaturedBooksStates {}

class FeaturedBooksLoadingState extends FeaturedBooksStates {}

class FeaturedBooksSuccessState extends FeaturedBooksStates {
  final List<BookEntity> books;

  FeaturedBooksSuccessState({required this.books});
}

class FeaturedBooksErrorState extends FeaturedBooksStates {
  final String errorMessage;

  FeaturedBooksErrorState({required this.errorMessage});
}

class FeaturedBooksPaginationLoadingState extends FeaturedBooksStates {}

class FeaturedBooksPaginationErrorState extends FeaturedBooksStates {
  final String errorMessage;

  FeaturedBooksPaginationErrorState({required this.errorMessage});
}

