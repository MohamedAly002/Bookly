import 'package:bookly/features/Home/presentation/view/widgets/book_image_view_item.dart';
import 'package:flutter/material.dart';

class BooksViewItemListView extends StatelessWidget {
  const BooksViewItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 15),
            child: BookImageViewItem(),
          );
        },
      ),
    );
  }
}
