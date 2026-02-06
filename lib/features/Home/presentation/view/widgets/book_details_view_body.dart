import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/Home/presentation/view/widgets/book_rating.dart';
import 'package:bookly/features/Home/presentation/view/widgets/featured_book_image_item.dart';
import 'package:bookly/features/Home/presentation/view/widgets/books_action_buttons.dart';
import 'package:bookly/features/Home/presentation/view/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/Home/presentation/view/widgets/similar_books_listview.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        SizedBox(
          width: screenWidth * 0.45,
          child: const FeaturedBookImageItem(
              imageUrl:
                  'https://www.freepik.com/free-photo/closeup-scarlet-macaw-from-side-view-scarlet-macaw-closeup-head_27271706.htm#fromView=keyword&page=1&position=0&uuid=cdfed68e-9a5e-4468-a8f7-5c8932e0099d&query=Animale'),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'The Jungle Book',
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w400),
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: '4.5',
          ratingcount: '(2.3k)',
        ),
        const SizedBox(
          height: 30,
        ),
        const BooksActionButtons(),
        const Expanded(
          child: SizedBox(
            height: 30,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You might also like',
                style: Styles.textStyle16,
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}
