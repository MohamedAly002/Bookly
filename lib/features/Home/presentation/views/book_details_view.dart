import 'package:bookly/config/di/di.dart';
import 'package:bookly/features/Home/domain/models/items_model.dart';
import 'package:bookly/features/Home/domain/use_cases/get_similar_books_use_case.dart';
import 'package:bookly/features/Home/presentation/view_model/books_details_cubit/books_details_cubit.dart';
import 'package:bookly/features/Home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookItem});
  final ItemsModel bookItem;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<BooksDetailsCubit>()..
        fetchSimilarBooks(
            category: widget.bookItem.volumeInfo.categories[0]),
      child: SafeArea(
        child: Scaffold(
          body: BookDetailsViewBody(
            bookitem: widget.bookItem,
          ),
        ),
      ),
    );
  }
}
