import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/Home/presentation/view/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

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
              aspectRatio: 2.5 / 4,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                          image: AssetImage(AssetsData.booktest),
                          fit: BoxFit.fill))),
            ),
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
                        "Harry Potter and the Goblet of Fire",
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGtSectraFine),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "J.K Rowling",
                      style: Styles.textStyle14
                          .copyWith(color: Colors.grey.shade400),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    const Row(
                      children: [
                        Text(
                          "19.99\$",
                          style: Styles.textStyle20,
                        ),
                        Spacer(),
                        BookRating(),
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
