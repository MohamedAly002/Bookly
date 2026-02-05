import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/Home/presentation/view/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewestBookItem extends StatelessWidget {
  const NewestBookItem({super.key, required this.imagurl, required this.title, required this.author,  required this.rating, required this.ratingCount});
  final String imagurl;
  final String title;
  final String author;
  final String? rating;
  final String? ratingCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouters.bookDetailsView);
      },
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 2.6 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: imagurl,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                )),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        title,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGtSectraFine),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      author,
                      style: Styles.textStyle14
                          .copyWith(color: Colors.grey.shade400),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                     Row(
                      children: [
                        const Text(
                          'Free',
                          style: Styles.textStyle20,
                        ),
                        const Spacer(),
                        BookRating(rating: rating, ratingcount: ratingCount),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
