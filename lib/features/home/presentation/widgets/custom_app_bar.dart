import 'package:bookly_app_clean_arc/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Image.asset(
            AssetsData.logo,
            height: 18,
          ),
        ),
      ],
    );
  }
}
