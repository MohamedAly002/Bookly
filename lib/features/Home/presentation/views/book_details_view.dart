import 'package:bookly/config/models/book_model/item.dart';
import 'package:bookly/config/service_locator/service_locator.dart';
import 'package:bookly/features/Home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/Home/presentation/view_model/books_details_cubit/books_details_cubit.dart';
import 'package:bookly/features/Home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookItem});
  final Item bookItem;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksDetailsCubit(getit.get<HomeRepoImpl>())
        ..fetchSimilarBooks(
            category: widget.bookItem.volumeInfo.categories![0]),
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
