import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/Home/presentation/view/widgets/best_seller_listview.dart';
import 'package:bookly/features/Home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly/features/Home/presentation/view/widgets/highlight_books_listview.dart';
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
          CustomAppBar(),
          HighlightBooksListView(),
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
            height: 25,
          ),
        ],
      )),
      SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30,),
            child: BestSellerListView(),
          )),
    ]);
  }
}
