import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/features/Home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedBookImageItem extends StatelessWidget {
  const FeaturedBookImageItem({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouters.bookDetailsView),
      child: AspectRatio(
          aspectRatio: 2.7 / 4, child: CustomBookImage(imagurl: imageUrl)),
    );
  }
}
