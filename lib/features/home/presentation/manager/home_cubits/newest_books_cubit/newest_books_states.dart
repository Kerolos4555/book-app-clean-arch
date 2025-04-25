import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';

abstract class NewestBooksStates {}

class NewestBooksInitialState extends NewestBooksStates {}

class NewestBooksLoadingState extends NewestBooksStates {}

class NewestBooksSuccessState extends NewestBooksStates {
  final List<BookEntity> books;

  NewestBooksSuccessState({required this.books});
}

class NewestBooksErrorState extends NewestBooksStates {
  final String errorMessage;

  NewestBooksErrorState({required this.errorMessage});
}

class NewestBooksPaginationLoadingState extends NewestBooksStates {}

class NewestBooksPaginationErrorState extends NewestBooksStates {
  final String errorMessage;

  NewestBooksPaginationErrorState({required this.errorMessage});
}
