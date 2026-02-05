import 'package:bookly/core/errors/error_widget.dart';
import 'package:bookly/features/Home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/Home/presentation/view/widgets/newest_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.books.items!.length,
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: NewestBookItem(
                  imagurl: state.books.items![index]
                      .volumeInfo
                      .imageLinks
                      .thumbnail,
                  title: state.books.items![index].volumeInfo.title??"unknown title",
                  author: state.books.items![index].volumeInfo.authors![0],
                  rating: state.books.items![index].volumeInfo.averageRating?.toString(),
                  ratingCount: state.books.items![index].volumeInfo.ratingsCount?.toString(),
                  

                ),
              ),
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: Errorwidget(message: state.errormessage),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}