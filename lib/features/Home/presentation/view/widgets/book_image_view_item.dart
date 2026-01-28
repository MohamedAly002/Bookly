import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookImageViewItem extends StatelessWidget {
  const BookImageViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouters.bookDetailsView),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                    image: AssetImage(AssetsData.booktest), fit: BoxFit.fill))),
      ),
    );
  }
}
