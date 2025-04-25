import 'package:bookly_app_clean_arc/core/widgets/custom_fading_indicator.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/custom_book_image_loading_indicator.dart';
import 'package:flutter/material.dart';

class HorizontalBooksLostLoadingIndicator extends StatelessWidget {
  const HorizontalBooksLostLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingIndicator(
      childWidget: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              const CustomBookImageLoadingIndicator(),
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemCount: 15,
        ),
      ),
    );
  }
}
