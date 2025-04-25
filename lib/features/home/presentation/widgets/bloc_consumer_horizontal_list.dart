import 'package:bookly_app_clean_arc/core/widgets/custom_error_widget.dart';
import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/manager/home_cubits/feature_books_cubit/fearture_books_cubit.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/manager/home_cubits/feature_books_cubit/feature_books_states.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/horizontal_books_list.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/horizontal_list_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocConsumerHorizontalList extends StatefulWidget {
  const BlocConsumerHorizontalList({super.key});

  @override
  State<BlocConsumerHorizontalList> createState() =>
      _BlocConsumerHorizontalListState();
}

class _BlocConsumerHorizontalListState
    extends State<BlocConsumerHorizontalList> {
  List<BookEntity> booksList = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksStates>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          booksList.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: CustomErrorWidget(
                errorMessage: state.errorMessage,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState ||
            state is FeaturedBooksPaginationLoadingState ||
            state is FeaturedBooksPaginationErrorState) {
          return HorizontalBooksList(
            books: booksList,
          );
        } else if (state is FeaturedBooksErrorState) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const HorizontalBooksLostLoadingIndicator();
        }
      },
    );
  }
}
