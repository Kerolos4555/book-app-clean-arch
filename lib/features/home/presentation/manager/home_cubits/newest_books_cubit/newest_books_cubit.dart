import 'package:bloc/bloc.dart';
import 'package:bookly_app_clean_arc/features/home/domain/use_cases/newest_books_use_case.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/manager/home_cubits/newest_books_cubit/newest_books_states.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates> {
  NewestBooksCubit({required this.newestBooksUseCase})
      : super(NewestBooksInitialState());

  final FetchNewestBooksUseCase newestBooksUseCase;
  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoadingState());
    } else {
      emit(NewestBooksPaginationLoadingState());
    }
    var result = await newestBooksUseCase.call(
      pageNumber: pageNumber,
    );
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(NewestBooksErrorState(errorMessage: failure.errorMessage));
        } else {
          emit(NewestBooksPaginationErrorState(
              errorMessage: failure.errorMessage));
        }
      },
      (books) {
        emit(NewestBooksSuccessState(books: books));
      },
    );
  }
}
