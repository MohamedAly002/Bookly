import 'package:bookly/config/errors/error_widget.dart';
import 'package:bookly/features/Home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/Home/presentation/views/widgets/featured_book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.items?.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: FeaturedBookImageItem(
                    bookItem: state.books.items![index],
                      imageUrl: state
                          .books.items![index].volumeInfo.imageLinks?.thumbnail??''),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Errorwidget(message: state.errormessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
