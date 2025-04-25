import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerList extends StatelessWidget {
  final List<BookEntity> books;
  const BestSellerList({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: BookItem(
          bookEntity: books[index],
        ),
      ),
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey[700],
        ),
      ),
      itemCount: books.length,
    );
  }
}
