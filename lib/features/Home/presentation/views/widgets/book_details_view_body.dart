import 'package:bookly/core/strings/app_strings.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/Home/domain/models/items_model.dart';
import 'package:bookly/features/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/Home/presentation/views/widgets/featured_book_image_item.dart';
import 'package:bookly/features/Home/presentation/views/widgets/books_action_buttons.dart';
import 'package:bookly/features/Home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/Home/presentation/views/widgets/similar_books_listview.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookitem});
  final ItemsModel bookitem;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CustomBookDetailsAppBar(),
            SizedBox(
              width: screenWidth * 0.45,
              child: FeaturedBookImageItem(
                  bookItem: bookitem,
                  imageUrl: bookitem.volumeInfo.imageLink),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              bookitem.volumeInfo.title ,
              style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            Opacity(
              opacity: 0.7,
              child: Text(
                bookitem.volumeInfo.authors[0] ,
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            BookRating(
              mainAxisAlignment: MainAxisAlignment.center,
              rating: "${bookitem.volumeInfo.averageRating }",
              ratingcount: '${bookitem.volumeInfo.ratingsCount }',
            ),
            const SizedBox(
              height: 20,
            ),
            BooksActionButtons(
              itemModel: bookitem,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.similarBooksTitle,
                    style: Styles.textStyle16,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const SimilarBooksListView(),
          ],
        ),
      ),
    );
  }
}
