import 'package:bookly/config/base_state/base_state.dart';
import 'package:bookly/config/models/book_models/book_model.dart';

class BooksDetailsStates {
  BaseState<BooksModel> getSimilarBooksState = BaseState<BooksModel>(
    isLoading: true,
  );
  BaseState<BooksModel> previewBookState = BaseState<BooksModel>(
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
    final BaseState<BooksModel>? getSimilarBooksState,
    final BaseState<BooksModel>? previewBookState,
  }) {
    return BooksDetailsStates(
      getSimilarBooksState: getSimilarBooksState ?? this.getSimilarBooksState,
      previewBookState: previewBookState ?? this.previewBookState,
    );
  }
}
