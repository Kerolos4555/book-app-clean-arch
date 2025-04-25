import 'package:bookly_app_clean_arc/core/widgets/custom_error_widget.dart';
import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/manager/home_cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/manager/home_cubits/newest_books_cubit/newest_books_states.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/best_seller_list.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/best_seller_list_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocConsumerBestSellerList extends StatefulWidget {
  const BlocConsumerBestSellerList({super.key});

  @override
  State<BlocConsumerBestSellerList> createState() =>
      _BlocConsumerBestSellerListState();
}

class _BlocConsumerBestSellerListState
    extends State<BlocConsumerBestSellerList> {
  List<BookEntity> bookList = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksStates>(
      listener: (context, state) {
        if (state is NewestBooksSuccessState) {
          bookList.addAll(state.books);
        }
        if (state is NewestBooksPaginationErrorState) {
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
        if (state is NewestBooksSuccessState ||
            state is NewestBooksPaginationLoadingState ||
            state is NewestBooksPaginationLoadingState) {
          return BestSellerList(
            books: bookList,
          );
        } else if (state is NewestBooksErrorState) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const BestSellerListLoadingIndicator();
        }
      },
    );
  }
}
