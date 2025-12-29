import 'package:bookly/features/Home/presentation/view/widgets/highlight_book_item.dart';
import 'package:flutter/material.dart';

class HighlightBooksListView extends StatelessWidget {
  const HighlightBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: HighlightBookItem(),
            );
          },
        ),
      ),
    );
  }
}
