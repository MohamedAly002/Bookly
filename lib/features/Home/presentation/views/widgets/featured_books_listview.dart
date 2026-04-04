import 'package:bookly/config/errors/error_widget.dart';
import 'package:bookly/features/Home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:bookly/features/Home/presentation/view_model/home_cubit/home_cubit_states.dart';
import 'package:bookly/features/Home/presentation/views/widgets/featured_book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitStates>(
      builder: (context, state) {
        if (state.getFeaturedBooks.data != null) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.getFeaturedBooks.data!.items.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: FeaturedBookImageItem(
                      bookItem: state.getFeaturedBooks.data!.items[index],
                      imageUrl: state.getFeaturedBooks.data!.items[index]
                          .volumeInfo.imageLink),
                );
              },
            ),
          );
        } else if (state.getFeaturedBooks.errorMessage != null) {
          return SliverToBoxAdapter(child: ShowErrorWidget(message: state.getFeaturedBooks.errorMessage!));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
