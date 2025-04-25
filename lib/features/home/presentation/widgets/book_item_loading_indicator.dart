import 'package:bookly_app_clean_arc/features/home/presentation/widgets/custom_book_image_loading_indicator.dart';
import 'package:flutter/material.dart';

class BookItemLoadingIndicator extends StatelessWidget {
  const BookItemLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Row(
        children: [
          const CustomBookImageLoadingIndicator(),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Center(
              child: Container(
                height: 15,
                width: double.infinity,
                color: Colors.grey[50],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
