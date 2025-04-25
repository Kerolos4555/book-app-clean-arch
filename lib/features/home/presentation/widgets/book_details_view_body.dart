import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/book_actions.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/book_details_app_bar.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/book_image.dart';
import 'package:bookly_app_clean_arc/core/utils/styles.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/book_rate.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookEntity book;
  const BookDetailsViewBody({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const BookDetailsAppBar(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.23,
                  ),
                  child: BookImage(
                    imageUrl: book.image,
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  book.title,
                  style: Styles.textStyle30,
                ),
                const SizedBox(
                  height: 6,
                ),
                Opacity(
                  opacity: 0.9,
                  child: Text(
                    textAlign: TextAlign.center,
                    book.autherName,
                    style: Styles.textStyle18.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                BookRate(
                  rate: book.rating,
                ),
                const SizedBox(
                  height: 37,
                ),
                BookActions(
                  url: book.url,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
