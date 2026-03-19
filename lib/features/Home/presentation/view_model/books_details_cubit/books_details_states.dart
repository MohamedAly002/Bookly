import 'package:bookly/config/base_state/base_state.dart';
import 'package:bookly/config/models/book_model/book_model.dart';

class BooksDetailsStates {
  BaseState<BookModel> getSimilarBooksState = BaseState<BookModel>(
    isLoading: true,
  );
  BaseState<BookModel> previewBookState = BaseState<BookModel>(
    isLoading: false,
  );

  BooksDetailsStates({
    getSimilarBooksState,
    previewBookState,
  }) {
    this.getSimilarBooksState =
        getSimilarBooksState ?? this.getSimilarBooksState;
    this.previewBookState = previewBookState ?? this.previewBookState;
  }

  BooksDetailsStates copyWith({
    final BaseState<BookModel>? getSimilarBooksState,
    final BaseState<BookModel>? previewBookState,
  }) {
    return BooksDetailsStates(
      getSimilarBooksState: getSimilarBooksState ?? this.getSimilarBooksState,
      previewBookState: previewBookState ?? this.previewBookState,
    );
  }
}
