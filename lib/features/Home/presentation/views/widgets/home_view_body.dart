import 'package:bookly/core/theme/colors/colors.dart';
import 'package:bookly/core/values/strings/app_strings.dart';
import 'package:bookly/core/theme/styles.dart';
import 'package:bookly/features/Home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:bookly/features/Home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:bookly/features/Home/presentation/views/widgets/featured_books_listview.dart';
import 'package:bookly/features/Home/presentation/views/widgets/newest_books_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHomeAppBar(),
        Expanded(
          child: RefreshIndicator(
            color: AppColors.kprimaryColor,
            backgroundColor: AppColors.ksecondaryColor,
            onRefresh: () async {
              context.read<HomeCubit>().init();
            },
            child: const CustomScrollView(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FeaturedBooksListView(),
                      SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          AppStrings.newestBooktitle,
                          style: Styles.textStyle18,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  sliver: NewestBooksListView(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
