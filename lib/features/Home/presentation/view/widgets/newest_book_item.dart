import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/models/book_model/item.dart';
import 'package:bookly/features/Home/presentation/view/widgets/book_rating.dart';
import 'package:bookly/features/Home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestBookItem extends StatelessWidget {
  const NewestBookItem({super.key, required this.bookItem});
  final Item bookItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouters.bookDetailsView, extra: bookItem);
      },
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 2.6 / 4,
                child: CustomBookImage(
                  imagurl: bookItem.volumeInfo.imageLinks?.thumbnail??'',
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
                        bookItem.volumeInfo.title ?? 'Unknown Title',
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGtSectraFine),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      bookItem.volumeInfo.authors?[0] ??
                          'Unknown Author',
                      style: Styles.textStyle14
                          .copyWith(color: Colors.grey.shade400),
                          maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
                        BookRating(
                          rating: bookItem.volumeInfo.averageRating
                              ?.toString(),
                          ratingcount: bookItem
                              .volumeInfo.ratingsCount
                              ?.toString(),
                        ),
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
