import 'package:bookly/core/strings/app_strings.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/Home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:bookly/features/Home/presentation/views/widgets/featured_books_listview.dart';
import 'package:bookly/features/Home/presentation/views/widgets/newest_books_listview.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
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
              AppStrings.newestBooktitle,
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
