import 'package:bookly/config/base_state/base_state.dart';
import 'package:bookly/config/models/book_models/book_model.dart';
import 'package:equatable/equatable.dart';

class BooksDetailsStates extends Equatable {
  final BaseState<BooksModel> getSimilarBooksState;
  final BaseState<BooksModel> previewBookState;

  const BooksDetailsStates({
    this.getSimilarBooksState = const BaseState(),
    this.previewBookState = const BaseState(),
  });

  BooksDetailsStates copyWith({
    final BaseState<BooksModel>? getSimilarBooksState,
    final BaseState<BooksModel>? previewBookState,
  }) {
    return BooksDetailsStates(
      getSimilarBooksState: getSimilarBooksState ?? this.getSimilarBooksState,
      previewBookState: previewBookState ?? this.previewBookState,
    );
  }

  @override
  List<Object?> get props => [getSimilarBooksState, previewBookState];
}
