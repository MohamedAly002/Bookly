import 'package:bookly/config/models/book_model/item.dart';
import 'package:bookly/features/Home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
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
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilarBooks(category: widget.bookItem.volumeInfo.categories![0]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BookDetailsViewBody(
          bookitem: widget.bookItem,
        ),
      ),
    );
  }
}
