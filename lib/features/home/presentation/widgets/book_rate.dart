import 'package:bookly_app_clean_arc/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRate extends StatelessWidget {
  final num rate;
  const BookRate({
    super.key,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 18,
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          rate.toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 7,
        ),
        const Opacity(
          opacity: 0.5,
          child: Text(
            '0',
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
