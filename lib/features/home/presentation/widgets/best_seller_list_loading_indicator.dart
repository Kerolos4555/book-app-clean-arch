import 'package:bookly_app_clean_arc/core/widgets/custom_fading_indicator.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/book_item_loading_indicator.dart';
import 'package:flutter/material.dart';

class BestSellerListLoadingIndicator extends StatelessWidget {
  const BestSellerListLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingIndicator(
      childWidget: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: BookItemLoadingIndicator(),
        ),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[700],
          ),
        ),
        itemCount: 15,
      ),
    );
  }
}
