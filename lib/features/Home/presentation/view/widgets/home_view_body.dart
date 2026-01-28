import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/Home/presentation/view/widgets/best_seller_listview_item.dart';
import 'package:bookly/features/Home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:bookly/features/Home/presentation/view/widgets/books_view_items_listview.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverToBoxAdapter(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHomeAppBar(),
          BooksViewItemListView(),
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
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: BestSellerListViewItem(),
            ),
            childCount: 10,
          ),
        ),
      ),
    ]);
  }
}
