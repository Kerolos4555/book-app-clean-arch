import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/book_image.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/book_rate.dart';
import 'package:bookly_app_clean_arc/core/utils/constants.dart';
import 'package:bookly_app_clean_arc/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookItem extends StatelessWidget {
  final BookEntity bookEntity;
  const BookItem({
    super.key,
    required this.bookEntity,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          '/bookDetailsView',
          extra: bookEntity,
        );
      },
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            BookImage(
              imageUrl: bookEntity.image,
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookEntity.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    bookEntity.autherName,
                    style: Styles.textStyle14,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Spacer(),
                      BookRate(
                        rate: bookEntity.rating,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
