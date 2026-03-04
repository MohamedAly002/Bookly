import 'package:bookly/config/errors/error_widget.dart';
import 'package:bookly/features/Home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/Home/presentation/views/widgets/featured_book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
      if (state is SimilarBooksSuccess) {
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
                    bookItem: state.books.items![index],
                    imageUrl:
                        state.books.items![index].volumeInfo.imageLinks?.thumbnail??'',
                  ),
                );
              },
            ),
          ),
        );
      } else if (state is SimilarBooksFailure) {
        return Errorwidget(message: state.errormessage);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
