import 'package:bookly/config/errors/error_widget.dart';
import 'package:bookly/features/Home/presentation/view_model/books_details_cubit/books_details_cubit.dart';
import 'package:bookly/features/Home/presentation/view_model/books_details_cubit/books_details_states.dart';
import 'package:bookly/features/Home/presentation/views/widgets/featured_book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksDetailsCubit, BooksDetailsStates>(
        builder: (context, state) {
      if (state.getSimilarBooksState.data != null) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: FeaturedBookImageItem(
                    bookItem: state.getSimilarBooksState.data!.items[index],
                    imageUrl: state.getSimilarBooksState.data!.items[index]
                        .volumeInfo.imageLink,
                  ),
                );
              },
            ),
          ),
        );
      } else if (state.getSimilarBooksState.errorMessage != null) {
        return ShowErrorWidget(message: state.getSimilarBooksState.errorMessage!);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
