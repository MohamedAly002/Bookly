import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/Home/presentation/view/widgets/newest_book_item.dart';
import 'package:bookly/features/Home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:bookly/features/Home/presentation/view/widgets/featured_books_listview.dart';
import 'package:bookly/features/Home/presentation/view/widgets/newest_books_listview.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [
      SliverToBoxAdapter(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHomeAppBar(),
          FeaturedBooksListView(),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Best Seller',
              style: Styles.textStyle18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      )),
 SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          sliver: NewestBooksListView(),
        ),
    ]);
  }
}
