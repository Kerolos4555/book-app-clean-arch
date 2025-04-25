import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/manager/home_cubits/feature_books_cubit/fearture_books_cubit.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HorizontalBooksList extends StatefulWidget {
  final List<BookEntity> books;
  const HorizontalBooksList({
    super.key,
    required this.books,
  });

  @override
  State<HorizontalBooksList> createState() => _HorizontalBooksListState();
}

class _HorizontalBooksListState extends State<HorizontalBooksList> {
  late final ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxPosition = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxPosition) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(
          pageNumber: nextPage++,
        );
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.separated(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            GoRouter.of(context).push(
              '/bookDetailsView',
              extra: widget.books[index],
            );
          },
          child: BookImage(
            imageUrl: widget.books[index].image,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: widget.books.length,
      ),
    );
  }
}
