import 'package:bookly/config/app_routers/router_paths.dart';
import 'package:bookly/config/models/book_models/items_model.dart';
import 'package:bookly/core/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedBookImageItem extends StatelessWidget {
  const FeaturedBookImageItem(
      {super.key, required this.imageUrl, required this.bookItem});

  final String imageUrl;
  final ItemsModel bookItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(
        RouterPaths.bookDetailsView,
        extra: bookItem,
      ),
      child: AspectRatio(
          aspectRatio: 2.7 / 4, child: CustomBookImage(imagurl: imageUrl)),
    );
  }
}
