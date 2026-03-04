import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    required this.imagurl,
    super.key,
  });
  final String imagurl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: imagurl,
        fit: BoxFit.fill,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}