import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class HighlightBookItem extends StatelessWidget {
  const HighlightBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                  image: AssetImage(AssetsData.booktest), fit: BoxFit.fill))),
    );
  }
}
