import 'package:bookly/features/Home/presentation/view/widgets/book_listview_item.dart';
import 'package:flutter/material.dart';

class SearchResultListview extends StatelessWidget {
  const SearchResultListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(),
        ),
      ),
    );
  }
}
