import 'package:bloc/bloc.dart';
import 'package:bookly_app_clean_arc/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/manager/home_cubits/feature_books_cubit/feature_books_states.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit({required this.featuredBooksUseCase})
      : super(FeaturedBooksInitialState());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoadingState());
    } else {
      emit(FeaturedBooksPaginationLoadingState());
    }
    var result = await featuredBooksUseCase.call(
      pageNumber: pageNumber,
    );
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeaturedBooksErrorState(errorMessage: failure.errorMessage));
        } else {
          emit(FeaturedBooksPaginationErrorState(
              errorMessage: failure.errorMessage));
        }
      },
      (books) {
        emit(FeaturedBooksSuccessState(books: books));
      },
    );
  }
}
